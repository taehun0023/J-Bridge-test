/**
 * fix-jlpt-answers.js
 *
 * Reads seed_jlpt_quizzes.sql, finds all quiz_question_options INSERT blocks,
 * and shuffles the sort_order values (1-4) for each group of 4 options per question.
 * This ensures correct answers are roughly evenly distributed across all 4 positions
 * instead of clustering in positions 1-2.
 *
 * The script uses a balanced distribution strategy: it pre-assigns target positions
 * for correct answers across all questions, then shuffles within each question group
 * accordingly.
 */

const fs = require('fs');
const path = require('path');

const SEED_FILE = path.join(__dirname, '..', 'supabase', 'seed_jlpt_quizzes.sql');

// Fisher-Yates shuffle
function shuffle(arr) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a;
}

function main() {
  const content = fs.readFileSync(SEED_FILE, 'utf-8');
  const lines = content.split('\n');

  // Regex to match an option line:
  // (uuid_generate_v4(), 'question_id', 'option_text', TRUE/FALSE, sort_order)
  // The line may end with a comma or a semicolon or just a closing paren
  const optionLineRegex = /^(\s*)\(uuid_generate_v4\(\),\s*'([^']+)',\s*'([^']*)',\s*(TRUE|FALSE),\s*(\d+)\)([,;]?)$/;

  // First pass: collect all question groups (groups of 4 option lines with same question_id)
  // We need to identify which lines are option lines and group them.
  const lineInfos = [];
  for (let i = 0; i < lines.length; i++) {
    const match = lines[i].match(optionLineRegex);
    if (match) {
      lineInfos.push({
        lineIndex: i,
        indent: match[1],
        questionId: match[2],
        optionText: match[3],
        isCorrect: match[4] === 'TRUE',
        sortOrder: parseInt(match[5]),
        suffix: match[6], // comma, semicolon, or empty
      });
    }
  }

  // Group by question_id (preserving order of appearance)
  const questionGroups = [];
  let currentGroup = [];
  let currentQuestionId = null;

  for (const info of lineInfos) {
    if (info.questionId !== currentQuestionId) {
      if (currentGroup.length > 0) {
        questionGroups.push(currentGroup);
      }
      currentGroup = [info];
      currentQuestionId = info.questionId;
    } else {
      currentGroup.push(info);
    }
  }
  if (currentGroup.length > 0) {
    questionGroups.push(currentGroup);
  }

  console.log(`Found ${questionGroups.length} questions with options`);

  // Validate: each group should have exactly 4 options, exactly 1 correct
  for (let i = 0; i < questionGroups.length; i++) {
    const group = questionGroups[i];
    if (group.length !== 4) {
      console.error(`WARNING: Question ${group[0].questionId} has ${group.length} options (expected 4)`);
    }
    const correctCount = group.filter(o => o.isCorrect).length;
    if (correctCount !== 1) {
      console.error(`WARNING: Question ${group[0].questionId} has ${correctCount} correct answers (expected 1)`);
    }
  }

  // Create a balanced distribution of correct answer positions.
  // For N questions, we want roughly N/4 correct answers at each position (1,2,3,4).
  const totalQuestions = questionGroups.length;
  const targetPositions = [];
  for (let pos = 1; pos <= 4; pos++) {
    const count = Math.floor(totalQuestions / 4);
    for (let j = 0; j < count; j++) {
      targetPositions.push(pos);
    }
  }
  // Fill remaining slots (if totalQuestions not divisible by 4) with random positions
  const remainder = totalQuestions - targetPositions.length;
  const extraPositions = shuffle([1, 2, 3, 4]).slice(0, remainder);
  targetPositions.push(...extraPositions);

  // Shuffle the target positions so assignment is random
  const shuffledTargets = shuffle(targetPositions);

  console.log(`\nTarget correct-answer position distribution:`);
  for (let pos = 1; pos <= 4; pos++) {
    const count = shuffledTargets.filter(p => p === pos).length;
    console.log(`  Position ${pos}: ${count} (${(count / totalQuestions * 100).toFixed(1)}%)`);
  }

  // Now for each question group, shuffle the sort_order so the correct answer
  // lands at the target position.
  const newLines = [...lines];

  for (let qi = 0; qi < questionGroups.length; qi++) {
    const group = questionGroups[qi];
    const correctTargetPos = shuffledTargets[qi];

    // Find which option index within the group is correct
    const correctIdx = group.findIndex(o => o.isCorrect);

    // Create a shuffled assignment of sort_order values [1,2,3,4]
    // such that the correct option gets the target position.
    // Strategy: assign correctTargetPos to the correct option,
    // then randomly distribute remaining positions to the rest.
    const allPositions = [1, 2, 3, 4];
    const remainingPositions = allPositions.filter(p => p !== correctTargetPos);
    const shuffledRemaining = shuffle(remainingPositions);

    const newSortOrders = [];
    let remIdx = 0;
    for (let i = 0; i < group.length; i++) {
      if (i === correctIdx) {
        newSortOrders.push(correctTargetPos);
      } else {
        newSortOrders.push(shuffledRemaining[remIdx++]);
      }
    }

    // Now rewrite each line in the group with the new sort_order
    for (let i = 0; i < group.length; i++) {
      const info = group[i];
      const newSortOrder = newSortOrders[i];
      // Reconstruct the line
      const newLine = `${info.indent}(uuid_generate_v4(), '${info.questionId}', '${info.optionText}', ${info.isCorrect ? 'TRUE' : 'FALSE'}, ${newSortOrder})${info.suffix}`;
      newLines[info.lineIndex] = newLine;
    }
  }

  // Write the result
  fs.writeFileSync(SEED_FILE, newLines.join('\n'), 'utf-8');
  console.log(`\nWrote updated file to ${SEED_FILE}`);

  // Verify by re-reading and checking distribution
  console.log('\n--- Verification ---');
  const verifyContent = fs.readFileSync(SEED_FILE, 'utf-8');
  const verifyLines = verifyContent.split('\n');

  const positionCounts = { 1: 0, 2: 0, 3: 0, 4: 0 };
  let totalCorrect = 0;

  for (const line of verifyLines) {
    const match = line.match(optionLineRegex);
    if (match && match[4] === 'TRUE') {
      const pos = parseInt(match[5]);
      positionCounts[pos]++;
      totalCorrect++;
    }
  }

  console.log(`Total correct answers: ${totalCorrect}`);
  console.log('Correct answer distribution by sort_order position:');
  for (let pos = 1; pos <= 4; pos++) {
    const count = positionCounts[pos];
    console.log(`  Position ${pos}: ${count} (${(count / totalCorrect * 100).toFixed(1)}%)`);
  }
}

main();
