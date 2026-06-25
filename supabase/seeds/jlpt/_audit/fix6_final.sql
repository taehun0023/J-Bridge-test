-- fix6_final: SENTENCE_ORDER 11문항 직접 재작성(검증완료) + 유형오분류 2 + 어휘 4
-- 각 문항: 語群 ①=sort_order1 … ④=sort_order4, 정답(★ 3번째 빈칸 어구)만 is_correct=true.

-- ============ SENTENCE_ORDER (검증된 완성문) ============

-- aee10036  완성문: 彼の功績は国民の称賛に値する立派なものだ (★=値する, s1)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

彼の功績は　＿＿　＿＿　★　＿＿　ものだ。
（語群：①値する　②立派な　③国民の　④称賛に）' WHERE id='aee10036-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee10036-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET option_text='値する', is_correct=true WHERE question_id='aee10036-0000-0000-0000-000000000001' AND sort_order=1;
UPDATE quiz_question_options SET option_text='立派な' WHERE question_id='aee10036-0000-0000-0000-000000000001' AND sort_order=2;
UPDATE quiz_question_options SET option_text='国民の' WHERE question_id='aee10036-0000-0000-0000-000000000001' AND sort_order=3;
UPDATE quiz_question_options SET option_text='称賛に' WHERE question_id='aee10036-0000-0000-0000-000000000001' AND sort_order=4;

-- aee10037  완성문: 値段が高いからといって必ずしも品質が良いわけではない (★=品質が, s3)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

値段が高い　＿＿　＿＿　★　＿＿　わけではない。
（語群：①良い　②からといって　③品質が　④必ずしも）' WHERE id='aee10037-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee10037-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET option_text='良い' WHERE question_id='aee10037-0000-0000-0000-000000000001' AND sort_order=1;
UPDATE quiz_question_options SET option_text='からといって' WHERE question_id='aee10037-0000-0000-0000-000000000001' AND sort_order=2;
UPDATE quiz_question_options SET option_text='品質が', is_correct=true WHERE question_id='aee10037-0000-0000-0000-000000000001' AND sort_order=3;
UPDATE quiz_question_options SET option_text='必ずしも' WHERE question_id='aee10037-0000-0000-0000-000000000001' AND sort_order=4;

-- aee10038  완성문: 社長はいかなる困難にもためらわず改革を断行した (★=ためらわず, s4)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

社長は　＿＿　＿＿　★　＿＿　断行した。
（語群：①いかなる　②困難にも　③改革を　④ためらわず）' WHERE id='aee10038-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee10038-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET option_text='いかなる' WHERE question_id='aee10038-0000-0000-0000-000000000001' AND sort_order=1;
UPDATE quiz_question_options SET option_text='困難にも' WHERE question_id='aee10038-0000-0000-0000-000000000001' AND sort_order=2;
UPDATE quiz_question_options SET option_text='改革を' WHERE question_id='aee10038-0000-0000-0000-000000000001' AND sort_order=3;
UPDATE quiz_question_options SET option_text='ためらわず', is_correct=true WHERE question_id='aee10038-0000-0000-0000-000000000001' AND sort_order=4;

-- aee10039  완성문: 彼は自らの過ちを潔く認めることを決意した (★=潔く, s2)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

彼は　＿＿　＿＿　★　＿＿　決意した。
（語群：①認めることを　②潔く　③自らの　④過ちを）' WHERE id='aee10039-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee10039-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET option_text='認めることを' WHERE question_id='aee10039-0000-0000-0000-000000000001' AND sort_order=1;
UPDATE quiz_question_options SET option_text='潔く', is_correct=true WHERE question_id='aee10039-0000-0000-0000-000000000001' AND sort_order=2;
UPDATE quiz_question_options SET option_text='自らの' WHERE question_id='aee10039-0000-0000-0000-000000000001' AND sort_order=3;
UPDATE quiz_question_options SET option_text='過ちを' WHERE question_id='aee10039-0000-0000-0000-000000000001' AND sort_order=4;

-- aee20036  완성문: 彼は初めから嘘をつくつもりは全くなかった (★=つくつもりは, s1)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

彼は　＿＿　＿＿　★　＿＿　なかった。
（語群：①つくつもりは　②初めから　③嘘を　④全く）' WHERE id='aee20036-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee20036-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET option_text='つくつもりは', is_correct=true WHERE question_id='aee20036-0000-0000-0000-000000000002' AND sort_order=1;
UPDATE quiz_question_options SET option_text='初めから' WHERE question_id='aee20036-0000-0000-0000-000000000002' AND sort_order=2;
UPDATE quiz_question_options SET option_text='嘘を' WHERE question_id='aee20036-0000-0000-0000-000000000002' AND sort_order=3;
UPDATE quiz_question_options SET option_text='全く' WHERE question_id='aee20036-0000-0000-0000-000000000002' AND sort_order=4;

-- aee20037  완성문: その判断は状況からすれば必ずしも適切だとは言えない (★=必ずしも, s3)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

その判断は　＿＿　＿＿　★　＿＿　言えない。
（語群：①適切だとは　②状況から　③必ずしも　④すれば）' WHERE id='aee20037-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee20037-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET option_text='適切だとは' WHERE question_id='aee20037-0000-0000-0000-000000000002' AND sort_order=1;
UPDATE quiz_question_options SET option_text='状況から' WHERE question_id='aee20037-0000-0000-0000-000000000002' AND sort_order=2;
UPDATE quiz_question_options SET option_text='必ずしも', is_correct=true WHERE question_id='aee20037-0000-0000-0000-000000000002' AND sort_order=3;
UPDATE quiz_question_options SET option_text='すれば' WHERE question_id='aee20037-0000-0000-0000-000000000002' AND sort_order=4;

-- aee20038  완성문: 成否はともかく最後までやり抜くことが大切だ (★=最後まで, s4)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

成功は　＿＿　＿＿　★　＿＿　大切だ。
（語群：①やり抜くことが　②成否は　③ともかく　④最後まで）' WHERE id='aee20038-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee20038-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET option_text='やり抜くことが' WHERE question_id='aee20038-0000-0000-0000-000000000002' AND sort_order=1;
UPDATE quiz_question_options SET option_text='成否は' WHERE question_id='aee20038-0000-0000-0000-000000000002' AND sort_order=2;
UPDATE quiz_question_options SET option_text='ともかく' WHERE question_id='aee20038-0000-0000-0000-000000000002' AND sort_order=3;
UPDATE quiz_question_options SET option_text='最後まで', is_correct=true WHERE question_id='aee20038-0000-0000-0000-000000000002' AND sort_order=4;

-- aee20039  완성문: 上司に言われるまでもなく自分で気づくべきだった (★=自分で, s2)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

上司に　＿＿　＿＿　★　＿＿　べきだった。
（語群：①気づく　②自分で　③言われる　④までもなく）' WHERE id='aee20039-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee20039-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET option_text='気づく' WHERE question_id='aee20039-0000-0000-0000-000000000002' AND sort_order=1;
UPDATE quiz_question_options SET option_text='自分で', is_correct=true WHERE question_id='aee20039-0000-0000-0000-000000000002' AND sort_order=2;
UPDATE quiz_question_options SET option_text='言われる' WHERE question_id='aee20039-0000-0000-0000-000000000002' AND sort_order=3;
UPDATE quiz_question_options SET option_text='までもなく' WHERE question_id='aee20039-0000-0000-0000-000000000002' AND sort_order=4;

-- aee20040  완성문: 彼女の功績は誰もが讃えるに余りある (★=讃える, s1)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

彼女の　＿＿　＿＿　★　＿＿　余りある。
（語群：①讃える　②に　③功績は　④誰もが）' WHERE id='aee20040-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee20040-0000-0000-0000-000000000002';
UPDATE quiz_question_options SET option_text='讃える', is_correct=true WHERE question_id='aee20040-0000-0000-0000-000000000002' AND sort_order=1;
UPDATE quiz_question_options SET option_text='に' WHERE question_id='aee20040-0000-0000-0000-000000000002' AND sort_order=2;
UPDATE quiz_question_options SET option_text='功績は' WHERE question_id='aee20040-0000-0000-0000-000000000002' AND sort_order=3;
UPDATE quiz_question_options SET option_text='誰もが' WHERE question_id='aee20040-0000-0000-0000-000000000002' AND sort_order=4;

-- aee30037  완성문: その提案が常に合理的であるとは必ずしも言えない (★=であるとは, s3)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

その提案が　＿＿　＿＿　★　＿＿　言えない。
（語群：①必ずしも　②常に　③であるとは　④合理的）' WHERE id='aee30037-0000-0000-0000-000000000003';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee30037-0000-0000-0000-000000000003';
UPDATE quiz_question_options SET option_text='必ずしも' WHERE question_id='aee30037-0000-0000-0000-000000000003' AND sort_order=1;
UPDATE quiz_question_options SET option_text='常に' WHERE question_id='aee30037-0000-0000-0000-000000000003' AND sort_order=2;
UPDATE quiz_question_options SET option_text='であるとは', is_correct=true WHERE question_id='aee30037-0000-0000-0000-000000000003' AND sort_order=3;
UPDATE quiz_question_options SET option_text='合理的' WHERE question_id='aee30037-0000-0000-0000-000000000003' AND sort_order=4;

-- aee30039  완성문: 彼が事情を知らなかったとは言えまい (★=とは, s4)
UPDATE quiz_questions SET question_text='次の文の　★　に入る最もよいものを、１・２・３・４から一つ選びなさい。

彼が　＿＿　＿＿　★　＿＿　まい。
（語群：①言える　②事情を　③知らなかった　④とは）' WHERE id='aee30039-0000-0000-0000-000000000003';
UPDATE quiz_question_options SET is_correct=false WHERE question_id='aee30039-0000-0000-0000-000000000003';
UPDATE quiz_question_options SET option_text='言える' WHERE question_id='aee30039-0000-0000-0000-000000000003' AND sort_order=1;
UPDATE quiz_question_options SET option_text='事情を' WHERE question_id='aee30039-0000-0000-0000-000000000003' AND sort_order=2;
UPDATE quiz_question_options SET option_text='知らなかった' WHERE question_id='aee30039-0000-0000-0000-000000000003' AND sort_order=3;
UPDATE quiz_question_options SET option_text='とは', is_correct=true WHERE question_id='aee30039-0000-0000-0000-000000000003' AND sort_order=4;

-- ============ 유형 오분류 (GRAMMAR_CHOICE → CONTEXT_WORD) ============
UPDATE quiz_questions SET question_subtype='CONTEXT_WORD' WHERE id='aee10033-0000-0000-0000-000000000001';
UPDATE quiz_questions SET question_subtype='CONTEXT_WORD',
  question_text='（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

環境問題は社会を（　　）取り組むべき課題であり、個人・企業・政府すべての責任だ。'
WHERE id='aee30034-0000-0000-0000-000000000003';

-- ============ 어휘 용법/자연성 ============
UPDATE quiz_questions SET question_text='（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

長年の誤解が解け、両国は（　　）関係を取り戻した。' WHERE id='aee10007-0000-0000-0000-000000000001';
UPDATE quiz_question_options SET option_text='引き受けて' WHERE question_id='aee20008-0000-0000-0000-000000000002' AND sort_order=1;
UPDATE quiz_question_options SET option_text='従い' WHERE question_id='aee30008-0000-0000-0000-000000000003' AND sort_order=4;
UPDATE quiz_questions SET question_text='（　　）に入れるのに最もよいものを、１・２・３・４から一つ選びなさい。

長年の研究が（　　）を上げ始め、チームに活気が戻ってきた。' WHERE id='aee30009-0000-0000-0000-000000000003';
