#!/usr/bin/env node
/**
 * Validate quiz JSON files against templates/quiz_schema.json
 * Usage: node scripts/validate_quiz_schema.js content
 */
const fs = require("fs");
const path = require("path");
const Ajv = require("ajv");

const root = process.argv[2] || "content";
const schemaPath = path.join("templates", "quiz_schema.json");
const schema = JSON.parse(fs.readFileSync(schemaPath, "utf-8"));

const ajv = new Ajv({ allErrors: true, allowUnionTypes: true });
const validate = ajv.compile(schema);

function walk(dir, out=[]) {
  for (const name of fs.readdirSync(dir)) {
    const p = path.join(dir, name);
    const st = fs.statSync(p);
    if (st.isDirectory()) walk(p, out);
    else if (name.endsWith(".quiz.json")) out.push(p);
  }
  return out;
}

const files = fs.existsSync(root) ? walk(root) : [];
let ok = true;

for (const f of files) {
  const data = JSON.parse(fs.readFileSync(f, "utf-8"));
  const valid = validate(data);
  if (!valid) {
    ok = false;
    console.error("\nINVALID:", f);
    console.error(validate.errors);
  }
}

if (!files.length) {
  console.log("No .quiz.json files found under", root);
  process.exit(0);
}

if (ok) {
  console.log("All quiz JSON files are valid:", files.length);
  process.exit(0);
} else {
  process.exit(1);
}
