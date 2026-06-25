-- 전수검토 3차: 독해/청해 理解チェック 정답 인덱스 정정 (검증된 29건)
-- 독해 (jlpt_reading_passages) 7건
UPDATE jlpt_reading_passages SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='日本の消費行動の変化';
UPDATE jlpt_reading_passages SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='日本の四季と文学';
UPDATE jlpt_reading_passages SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='量子コンピューティングの現状と課題';
UPDATE jlpt_reading_passages SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='企業のDX推進と組織変革';
UPDATE jlpt_reading_passages SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='持続可能な都市開発モデル';
UPDATE jlpt_reading_passages SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='食品ロス削減への挑戦';
UPDATE jlpt_reading_passages SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='教育格差と社会的再生産のメカニズム';

-- 청해 (jlpt_listening_scripts) 22건
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='地域活性化の座談会';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='教育改革についての討論';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='環境保護NPOの活動報告';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='AI倫理に関する学会討論';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='医療倫理委員会の審議';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','0') WHERE jlpt_level='N1' AND title='日本企業の海外展開戦略';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='裁判員制度の説明会';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='脱炭素社会に向けた政策提言';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='文学賞選考委員会の議論';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='災害医療の最前線';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='国際金融市場の動向分析';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='先端医療技術の倫理的課題';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='宇宙開発の国際協力';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='司法制度改革の論点';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='人工知能と雇用の未来';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='文化財修復の最新技術';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='都市計画と地域コミュニティ';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='量子コンピータの産業応用';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='日本語の敬語体系に関する講義';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','2') WHERE jlpt_level='N1' AND title='国際通商紛争の分析';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='哲学カフェでの自由意志論';
UPDATE jlpt_listening_scripts SET comprehension=jsonb_set(comprehension,'{answer}','1') WHERE jlpt_level='N1' AND title='国際人道法の適用問題';
