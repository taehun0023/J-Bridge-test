-- N1 聴解 モック問題 バッチ2
-- 問題数: 30
-- 正答位置分布: 1番=8問, 2番=7問, 3番=7問, 4番=8問
-- 作成日: 2026-06-25
-- 注意: DB適用前にレビュー必須

-- 問1 (正答:1) 企業M&A — 統合後の人員配置
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nA（買収側CFO）：先方の経理部門は現在28名ですが、統合後は我々の既存システムに移行しますので、重複機能を精査した上で最終的には12名程度に集約する方向で検討しております。B（統合委員長）：その削減幅は想定より大きい。段階的な移行期間を設けつつ、希望退職募集と並行して再配置先を確保しなければ、現場の混乱は避けられないでしょう。A：おっしゃる通りで、移行完了まで18か月の猶予期間を設ける案を持参しております。\n質問：AはB統合委員長に対し、人員集約についてどのように説明しましたか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('重複機能を見直し、18か月かけて段階的に12名規模へ縮小する計画を提示した',true,1),
  ('希望退職募集を優先し、人員削減の時期は未定であると述べた',false,2),
  ('統合後も経理部門の規模は変えず、システム移行のみ行うと説明した',false,3),
  ('28名全員を他部署へ異動させ、経理業務を外部委託すると提案した',false,4)
) AS t(txt,ok,so);

-- 問2 (正答:2) 学術研究発表Q&A — 神経科学
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n研究者A：発表で示された海馬のシナプス可塑性データですが、サンプル数が23例と限られています。この知見を成人全般に敷衍するには統計的根拠が脆弱ではないでしょうか。研究者B：ご指摘はもっともです。ただ、我々の研究では縦断的コホートを採用しており、横断研究と比較して交絡因子の制御が格段に優れております。今後は倫理委員会の承認を経て対象を100例まで拡充する予定ですので、暫定的知見と位置づけていただければ幸いです。\n質問：研究者Bはサンプル数の少なさへの批判に対し、どのように答えましたか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('横断研究の手法を採用しているため交絡因子は問題にならないと反論した',false,1),
  ('縦断コホートの優位性を挙げ、今後100例まで拡充予定の暫定知見と説明した',true,2),
  ('サンプル不足を認め、研究の撤回を検討していると述べた',false,3),
  ('倫理委員会がすでに承認済みであるため批判は不当だと主張した',false,4)
) AS t(txt,ok,so);

-- 問3 (正答:3) 医療・福祉 — 在宅緩和ケア方針
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n担当医：お母様の現在の病状から、根治を目指す治療は身体的負担が大きく、QOLを著しく損なう恐れがあります。今後は緩和ケアへの移行を視野に入れ、疼痛管理と在宅療養支援を主軸に置くことをお勧めしたいのですが。家族：本人はできる限り自宅で過ごしたいと言っております。訪問看護や往診の体制はどの程度整えられますか。担当医：週3回の訪問看護と月2回の往診を基本とし、急変時は24時間対応の在宅クリニックと連携する体制を組むことができます。\n質問：担当医が提案した在宅療養体制の内容はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('毎日訪問看護を行い、週1回の往診と24時間対応クリニック連携を組み合わせる',false,1),
  ('月2回の訪問看護と週1回の往診を基本とし、緊急時は病院搬送を優先する',false,2),
  ('週3回訪問看護・月2回往診を基本に、急変時は24時間対応クリニックと連携する',true,3),
  ('在宅療養は困難と判断し、ホスピス入所を第一選択として勧めた',false,4)
) AS t(txt,ok,so);

-- 問4 (正答:4) 法律・契約 — 秘密保持条項の解釈
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n弁護士A：本契約の第7条は秘密保持義務の存続期間を「契約終了後5年間」と定めていますが、相手方は開示情報の一部が公知情報に該当するため義務が免除されると主張しています。弁護士B：公知性の主張は理解できますが、当該情報が公知となった時点・経緯の立証責任は相手方にあります。単に同種情報が市場に流通しているだけでは不十分で、当社が開示した情報そのものの公知性を証明しなければなりません。\n質問：弁護士Bは相手方の主張に対してどのような反論をしましたか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('秘密保持期間が5年以上残っているため、公知性の主張は時期尚早だと述べた',false,1),
  ('同種情報の流通があれば公知性は自動的に認められると認めた',false,2),
  ('相手方の主張を全面的に認め、秘密保持義務の免除に同意した',false,3),
  ('公知性の立証責任は相手方にあり、同種情報の流通だけでは不十分だと指摘した',true,4)
) AS t(txt,ok,so);

-- 問5 (正答:1) ITシステム障害対応 — 本番DB復旧
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nインフラ担当：本番データベースのプライマリノードが応答不能になったのは14時32分です。レプリカへの自動フェイルオーバーは発動しましたが、レプリケーション遅延が約8分あったため、その間のトランザクションデータが消失しております。現在はレプリカを昇格させてサービスは復旧済みですが、消失分については手動ログ解析で補完可能か確認中です。PMO：RPOは30分以内と定めていたはずですが、今回の8分消失はRTO基準は満たしつつもRPO違反に当たります。再発防止策を今週中に提出してください。\n質問：今回の障害で何が問題となりましたか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('レプリケーション遅延により8分分のデータが消失し、RPO基準に違反した',true,1),
  ('自動フェイルオーバーが発動せず、サービス復旧に数時間かかった',false,2),
  ('手動ログ解析に失敗し、消失データの復元が不可能になった',false,3),
  ('RTOとRPOの両方に違反し、サービスが全面停止した',false,4)
) AS t(txt,ok,so);

-- 問6 (正答:2) 都市再開発住民説明会 — 騒音対策
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n事業者代表：本工事における振動・騒音については、環境基準値を下回るよう防音シートの重層設置と低騒音型重機の採用を徹底いたします。作業時間帯は平日7時から18時に限定し、近隣住居への影響を最小化します。住民代表：それでも就学前の子どもがいる家庭への影響が懸念されます。昼間の騒音ピーク時に保育所向けの代替スペースを用意するなどの配慮はいただけないでしょうか。事業者代表：ご要望を真摯に受け止め、近隣公共施設との調整を図ってまいります。\n質問：住民代表が追加で求めた配慮はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('工事時間を午前10時以降に短縮するよう求めた',false,1),
  ('騒音ピーク時に保育所向けの代替スペースを用意するよう求めた',true,2),
  ('防音シートをより厚いものに交換するよう要請した',false,3),
  ('工事を週3日以内に制限するよう申し入れた',false,4)
) AS t(txt,ok,so);

-- 問7 (正答:3) 国際交渉・外交 — 貿易協定の知財条項
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n首席交渉官A：知的財産の保護期間について、わが国は著作権70年を主張しておりますが、先方は50年で折り合いをつけたい意向です。この乖離をどう埋めるかが今次ラウンドの焦点となっています。首席交渉官B：保護期間の延長は自国のコンテンツ産業にとって有益ですが、公有領域の縮小につながるとして国内でも反対意見があります。段階的延長の条項を挿入することで双方が許容できる妥協点を模索すべきではないでしょうか。\n質問：交渉官Bが提案した解決策はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('著作権保護期間を相手国の主張通り50年に引き下げることを提案した',false,1),
  ('知的財産の保護期間を交渉対象から外し、別の議題に集中するよう求めた',false,2),
  ('段階的延長の条項を設けることで双方が受け入れられる妥協点を探ることを提案した',true,3),
  ('保護期間問題は国内法の改正後に再交渉することを要求した',false,4)
) AS t(txt,ok,so);

-- 問8 (正答:4) 文化財保存 — 修復技術の選定
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n文化財保護委員：今回の彩色壁画の修復では、従来の天然素材による補修法と、新開発の合成樹脂注入工法のどちらを採用するか議論が分かれています。保存科学者：天然素材法は可逆性が高く将来の再修復が容易ですが、耐久性の面では50年程度しか保証できません。一方、合成樹脂法は100年以上の耐久性が期待できますが、後世の技術者が修復する際の除去が困難になる懸念があります。ユネスコの「最小限の介入」原則に照らすと、可逆性の高い天然素材法が適切と考えます。\n質問：保存科学者が天然素材法を推奨した主な理由はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('天然素材法は合成樹脂法より耐久性が高く、100年以上の保存が可能だから',false,1),
  ('合成樹脂法はユネスコに認定されていない未承認技術だから',false,2),
  ('天然素材法の方がコストが低く、予算内で修復が完了できるから',false,3),
  ('可逆性が高く将来の再修復が容易であり、最小限の介入原則に合致するから',true,4)
) AS t(txt,ok,so);

-- 問9 (正答:1) 環境政策審議 — カーボンプライシング
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n審議委員A：炭素税と排出量取引制度の二本立てで温室効果ガスを削減する案ですが、産業界からは競争力低下への懸念が根強く提出されています。委員B：国境炭素調整措置を同時導入することで、国内産業の競争条件を海外と均等化できます。欧州ではすでに実施されており、WTO協定との整合性も確認されています。炭素価格を段階的に引き上げながら、歳入の一部を企業のグリーン投資支援に充てれば産業界の抵抗も和らぐでしょう。\n質問：委員Bが産業界の懸念に対して提示した対応策はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('国境炭素調整措置の導入と炭素税収入をグリーン投資支援に活用することを提案した',true,1),
  ('炭素税を廃止し、排出量取引制度のみに一本化することを提案した',false,2),
  ('産業界への炭素規制を10年間猶予することを提案した',false,3),
  ('WTO協定に違反するとして国境炭素調整措置の導入に反対した',false,4)
) AS t(txt,ok,so);

-- 問10 (正答:2) 金融リスク管理 — ストレステスト結果
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nリスク管理部長：今回のストレステスト結果では、金利が3%上昇するシナリオ下で自己資本比率が規制最低水準の8%を下回り、6.2%まで低下することが判明しました。不動産担保ローンのポートフォリオに集中リスクが存在します。経営委員：即刻、新規の不動産担保融資を一時停止し、既存ポートフォリオの分散を図るべきです。また、優先株式の発行で資本増強を検討してください。リスク管理部長：規制当局への事前報告義務もございますので、今週中に対応策をまとめます。\n質問：ストレステストで明らかになった問題はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('金利上昇時に流動性危機が発生し、預金引き出しに対応できなくなること',false,1),
  ('金利3%上昇シナリオで自己資本比率が規制最低水準を下回ること',true,2),
  ('不動産担保ローンの不良債権比率がすでに規制基準を超えていること',false,3),
  ('規制当局への報告が遅延し、行政処分のリスクが生じていること',false,4)
) AS t(txt,ok,so);

-- 問11 (正答:3) 教育改革 — 大学入試制度見直し
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n文部審議官：現行の一発勝負型入試は、思考力・表現力・主体性といった21世紀型スキルを測定できていないとの批判が根強くあります。有識者A：ポートフォリオ評価や複数回受験制の導入を進める大学も増えていますが、採点の公平性確保が最大の課題です。評価基準の標準化と評価者訓練の仕組みがなければ、かえって機会格差を拡大しかねません。審議官：公平性と多様な能力評価の両立こそが制度設計の核心です。デジタル技術を活用した採点支援ツールの開発も並行して進める方針です。\n質問：有識者Aが新しい入試制度導入における最大の課題として挙げたのは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('複数回受験制を導入すると受験機会が特定の富裕層に偏ること',false,1),
  ('デジタル採点ツールの開発コストが過大となり予算超過が避けられないこと',false,2),
  ('採点の公平性確保のための評価基準標準化と評価者訓練の仕組みが必要なこと',true,3),
  ('21世紀型スキルの定義が国際的に統一されておらず測定が困難なこと',false,4)
) AS t(txt,ok,so);

-- 問12 (正答:4) メディア倫理 — 情報源秘匿と公益性
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n編集長：内部告発者から入手した行政文書に基づく今回の報道ですが、当局から情報源の開示を求める令状が届きました。法務部長：ジャーナリストの情報源秘匿権は表現の自由の根幹をなすものであり、開示拒否が正当化される要件を慎重に検討すべきです。公益性が高く、情報源が違法行為をしていない場合は、裁判所命令に対しても秘匿の維持を争う余地があります。編集長：取材源の保護なくして内部告発は萎縮します。弁護団と連携して法廷で争う方針を固めます。\n質問：法務部長が情報源秘匿の維持を争える可能性があると述べた条件はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('当局の令状に記載された手続き上の瑕疵が証明できる場合',false,1),
  ('情報源が外国政府の要人であり外交特権が適用される場合',false,2),
  ('報道がすでに世論に広く認知され社会的影響が大きい場合',false,3),
  ('公益性が高く情報源が違法行為を行っていないと認められる場合',true,4)
) AS t(txt,ok,so);

-- 問13 (正答:1) 農業DX — スマート農業導入交渉
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nJAシステム担当：ドローンによる農薬散布と土壌センサーを組み合わせたスマート農業パッケージを提案しておりますが、高齢農家の多い当組合では操作習熟に要する時間が課題です。農業ITベンダー：その点は、導入後6か月間の常駐サポートと、タブレット一台で完結する直感的UIの提供で対応します。また、農業共済との連携により、機器損害を保険でカバーできる仕組みも整えました。普及を妨げる最大の障壁はコストと技術習熟の問題だと認識しており、その両面から支援します。\n質問：ベンダーが高齢農家の習熟問題に対して提示したサポート策はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('導入後6か月の常駐サポートと直感的UIのタブレット端末を提供すること',true,1),
  ('農業共済との連携による機器損害保険のみを提供すること',false,2),
  ('JA職員向けの集中講習を年2回開催し、農家への二次指導を依頼すること',false,3),
  ('高齢農家向けに操作を簡略化した低機能版パッケージを別途開発すること',false,4)
) AS t(txt,ok,so);

-- 問14 (正答:2) エネルギー転換政策 — 洋上風力の系統接続
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nエネルギー庁担当官：洋上風力の系統接続に関し、海底ケーブルの敷設コストが1GWあたり数百億円規模に上ることが普及の障壁になっています。電力会社代表：系統整備費用の社会的分担、すなわちコストの広域シェアリングを制度化しない限り、事業者単独で負担することは困難です。加えて、接続の優先順位を決める「ノンファーム接続」ルールの透明化も必要です。担当官：次期エネルギー基本計画に系統整備の国費投入と接続ルールの明確化を盛り込む方向で調整中です。\n質問：電力会社代表が求めた政策対応はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('洋上風力の買取価格を引き上げ、系統接続費用を補填すること',false,1),
  ('系統整備費用の社会的分担制度化とノンファーム接続ルールの透明化',true,2),
  ('海底ケーブル敷設を国が一括実施し、電力会社には使用料のみを課すこと',false,3),
  ('洋上風力事業者数を制限し、接続競合を事前に防ぐこと',false,4)
) AS t(txt,ok,so);

-- 問15 (正答:3) AI倫理委員会 — 顔認識技術の規制
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n倫理委員長：公共空間における顔認識技術の常時使用について、プライバシー権との抵触が論点となっています。専門委員A：欧州では顔認識のリアルタイム使用を原則禁止しつつ、重大犯罪捜査に限り司法機関の令状に基づく例外を認めています。一律禁止よりも、用途と利用主体を限定した比例原則に基づく規制の方が実効性があります。委員長：監視社会化のリスクと治安維持の必要性のバランスをどう立法化するかが課題ですね。\n質問：専門委員Aが適切な規制モデルとして提案したアプローチはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('顔認識技術の開発・輸出を全面禁止し国際条約で規律すること',false,1),
  ('公共空間での使用を民間に限定し、行政機関には無制限に認めること',false,2),
  ('原則禁止とし、重大犯罪捜査における司法令状による例外を設ける比例原則規制',true,3),
  ('市民の75%以上が同意した場合のみ自治体単位で使用を認めること',false,4)
) AS t(txt,ok,so);

-- 問16 (正答:4) スタートアップ投資検討 — タームシート交渉
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\nVCパートナー：バリュエーションはプレマネーで40億円というご提示ですが、現時点での月次経常収益は800万円。ARRベースでも倍率が高すぎます。創業者：競合他社の直近ラウンドが45億円水準でクローズしていることと、当社独自の特許ポートフォリオを勘案いただければ、この水準は妥当だと考えています。ただし、投資家の懸念を軽減するためにラチェット条項の導入も受け入れる用意があります。VCパートナー：ラチェットがあれば多少柔軟に考えられますが、KPIトリガーの設定が鍵になります。\n質問：創業者がVCの懸念を和らげるために提案した条件はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('バリュエーションを35億円に引き下げることを提案した',false,1),
  ('特許ポートフォリオをVCへ担保として差し入れることを提案した',false,2),
  ('投資家に優先配当権を付与する優先株式の発行を提案した',false,3),
  ('ラチェット条項の導入を受け入れることを提案した',true,4)
) AS t(txt,ok,so);

-- 問17 (正答:1) 外国人労働者政策 — 技能実習制度改革
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n参議院議員：技能実習制度は「技能移転」を建前としながら実態は低賃金労働力の確保策だとの国際的批判が高まっており、廃止・再編が避けられない状況です。厚生労働省担当者：新設される「育成就労」制度では、転籍の自由度を高めるとともに、最低賃金以上の報酬と日本語教育の義務付けを柱としています。ただ、受け入れ企業の中小・零細業者にとって追加コスト負担が重くなる懸念もあります。議員：制度の理念と実態の乖離を是正するためにも、監督体制の抜本的強化が不可欠です。\n質問：新「育成就労」制度の主な柱として挙げられたものはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('転籍の自由度向上・最低賃金以上の報酬・日本語教育の義務付け',true,1),
  ('受け入れ企業への補助金支給と受け入れ上限人数の拡大',false,2),
  ('技能実習制度の完全廃止と単純労働ビザの新設',false,3),
  ('監督機関の民営化と外部監査法人による年次審査の義務付け',false,4)
) AS t(txt,ok,so);

-- 問18 (正答:2) 地方創生 — 移住促進策の評価
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n地方創生研究者：移住奨励金の上限を100万円に引き上げた自治体では、移住者数が前年比2.3倍に増加しましたが、3年以内の転出率も高止まりしています。首長：経済的インセンティブだけでは定住に結びつかない。地域コミュニティへの参画促進と、移住者が起業・就職しやすい環境整備の方が中長期的な定着につながると考えています。研究者：実証分析でも、仕事と人間関係の充実度が定住意向の最も強い規定因子であることが確認されています。\n質問：首長が経済的インセンティブより重要だと考えているものはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('移住奨励金の金額をさらに引き上げ、競合自治体との差別化を図ること',false,1),
  ('地域コミュニティへの参画促進と起業・就職しやすい環境整備',true,2),
  ('移住者専用の住宅を整備し、生活コストを大幅に削減すること',false,3),
  ('転出率の高い移住者に対して奨励金の返還を求めること',false,4)
) AS t(txt,ok,so);

-- 問19 (正答:3) 健康食品規制 — 機能性表示の見直し
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n消費者庁審議官：機能性表示食品制度において、届出事業者が提出するシステマティックレビューの質にばらつきがあり、根拠の乏しい機能性が表示される事例が散見されます。食品安全専門家：欧州のEFSAモデルのように、第三者機関による事前審査を義務化することが抜本的解決策です。現行の届出制では行政のリソース不足もあって事後監視が機能していません。審議官：審査義務化は制度の信頼性を高めますが、中小事業者の参入障壁になる可能性も否定できません。\n質問：食品安全専門家が提案した解決策はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('機能性表示食品制度を廃止し、医薬品と同等の承認審査制度へ移行すること',false,1),
  ('シスマティックレビューの提出を免除し、臨床試験のみを証拠として認めること',false,2),
  ('第三者機関による事前審査の義務化をEFSAモデルを参考に導入すること',true,3),
  ('届出件数に上限を設け、大企業のみが参入できる許可制に切り替えること',false,4)
) AS t(txt,ok,so);

-- 問20 (正答:4) 特許紛争 — 標準必須特許のライセンス交渉
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n特許権者代理人：本件SEPに関し、FRAND条件でのライセンス料を製品販売価格の1.8%と提示しております。実施者代理人：業界標準の集積ロイヤリティを勘案すると、単一権利者への1.8%は著しく高率です。当該特許の技術的貢献度と類似SEPのコンパラブル・ライセンス事例をもとに算定すると、0.4〜0.6%が相当と考えます。特許権者：FRAND性の判断は最終的に裁判所の判断に委ねることも辞しませんが、まずは算定根拠を相互に開示して協議を続けることを望みます。\n質問：実施者代理人が主張したFRANDライセンス料の水準はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('製品販売価格の1.8%が相当であり、特許権者の提示は妥当だと認めた',false,1),
  ('業界全体のロイヤリティ総額が高すぎるとして無償ライセンスを要求した',false,2),
  ('製品販売価格の1.2%を提案し、双方の中間点での合意を目指した',false,3),
  ('コンパラブル事例をもとに0.4〜0.6%が相当と主張した',true,4)
) AS t(txt,ok,so);

-- 問21 (正答:1) M&A後の組織文化統合 — 人事制度摩擦
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n人事統合担当役員：買収先の旧来型年功賃金制度と、我々の成果連動型報酬体系の併存が摩擦を生んでいます。同一職務でも処遇差が40%に達するケースがあり、モチベーション格差が生産性に影響しています。組織心理コンサルタント：制度的な統合を急ぐより、まず文化的橋渡し役となる「チェンジエージェント」を両組織から選抜し、相互理解を醸成する期間を設けることが重要です。一足飛びの制度統一は反発を招き、優秀人材の離職を誘発する恐れがあります。\n質問：コンサルタントが推奨した最初のステップはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('両組織からチェンジエージェントを選抜し、相互理解を醸成する期間を設けること',true,1),
  ('成果連動型報酬を全社員に即時適用し、賃金格差を解消すること',false,2),
  ('年功賃金制度の維持を優先し、成果連動要素は5年後に導入すること',false,3),
  ('処遇格差を解消するため、買収先の全社員に一時金を支給すること',false,4)
) AS t(txt,ok,so);

-- 問22 (正答:2) 学術倫理 — 研究不正調査委員会
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n調査委員長：問題の論文では、画像データの一部が複数の実験条件間で使い回されていることが確認されました。本人はソフトウェアの操作ミスによる過失だと主張していますが、同一画像が5カ所以上で流用されており、過失の域を超えると判断しています。法務委員：不正認定には「意図の立証」が要件となる場合もありますが、状況証拠の積み重ねで故意性を推認できるかが争点です。研究機関としては、論文の撤回と関与した共著者全員への聴取を速やかに実施すべきでしょう。\n質問：法務委員が不正認定に際して争点として挙げたのは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('画像流用箇所が5カ所以上あるため刑事告発が可能かどうか',false,1),
  ('状況証拠の積み重ねで故意性（意図）を推認できるかどうか',true,2),
  ('共著者が画像流用を知っていたかどうかの事実認定',false,3),
  ('ソフトウェアのバグによる自動複製の可能性を否定できるかどうか',false,4)
) AS t(txt,ok,so);

-- 問23 (正答:3) 構造改革 — 社会保障財源の確保
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n財政制度等審議会委員A：少子高齢化の進展で社会保障費は2040年に対GDP比で現在の1.5倍に膨張するとの試算があります。消費税率の引き上げだけでは財源不足が見込まれ、給付と負担の見直しが不可避です。委員B：受益と負担の世代間公平を実現するには、金融資産課税の強化と、高所得高齢者への給付調整が有力な選択肢です。ただ、政治的実現可能性が低く、実務的には段階的かつ丁寧な国民への説明が求められます。\n質問：委員Bが財源確保策として挙げた手段はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('消費税率を段階的に25%まで引き上げること',false,1),
  ('社会保障給付を全年齢層に一律10%削減すること',false,2),
  ('金融資産課税の強化と高所得高齢者への給付調整',true,3),
  ('国債発行の上限を撤廃し、財政出動で経済成長を促すこと',false,4)
) AS t(txt,ok,so);

-- 問24 (正答:4) 製薬 — 適応外使用の倫理審査
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n倫理審査委員長：今回申請された治験は、既承認薬を希少疾患の新適応症に用いるものですが、非臨床データのみで第二相試験に進もうとしている点が審査上の懸念事項です。申請者（治験責任医師）：対象患者数が極めて少なく、プラセボ対照試験の実施が現実的でない希少疾患においては、観察研究データと生物学的妥当性をもって第一相を省略する規制当局のブレークスルー指定を取得しております。委員長：ブレークスルー指定の事実は確認しましたが、被験者保護の観点から安全性モニタリング計画の一層の充実を条件とします。\n質問：倫理審査委員会が承認に際して付した条件はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('プラセボ対照の第一相試験を実施してから第二相に進むこと',false,1),
  ('ブレークスルー指定を取り消し、通常の審査経路で申請し直すこと',false,2),
  ('対象患者を希少疾患以外にも拡大し、統計的検出力を確保すること',false,3),
  ('安全性モニタリング計画をさらに充実させること',true,4)
) AS t(txt,ok,so);

-- 問25 (正答:4) 建築・都市計画 — 容積率緩和と景観保護の対立
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n都市計画審議会委員A：駅周辺の容積率を現行の400%から600%に緩和することで、住宅供給を増加させ、地価上昇を抑制できる効果が期待されます。委員B：容積率緩和は建物の高層化を促し、周辺の日照・圧迫感・歴史的街並みへの影響が避けられません。景観法に基づく景観計画との整合性を事前に確認し、高さ制限や壁面後退ラインを併せて設定することを条件とすべきです。委員A：その点は設計指針で対応可能と考えますが、両立させるためのデザインガイドラインの策定を先行させましょう。\n質問：委員Bが容積率緩和に条件として求めた内容はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('容積率緩和を一切認めず、現行の400%を維持すること',false,1),
  ('住宅供給増加の効果を10年後に再評価することを求めた',false,2),
  ('駅周辺の地価が一定水準を超えた場合に容積率を自動的に引き戻すこと',false,3),
  ('景観計画との整合確認と高さ制限・壁面後退ラインの併設を条件とした',true,4)
) AS t(txt,ok,so);

-- 問26 (正答:1) 半導体サプライチェーン — 調達リスク評価
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n調達部長：主要ロジックチップの調達先が特定ファウンドリー1社に集中しており、地政学リスクへの脆弱性が増大しています。サプライチェーン戦略担当：マルチソーシング戦略として、現行のTSMC一社依存から、Samsung・国内新興ファウンドリーへの発注分散を2年以内に実現することを提案します。ただし、設計資産の移植コストと歩留まり差の補償コストを加味した総所有コスト分析が先行して必要です。調達部長：経済安全保障補助金の活用も視野に入れ、コスト増を最小化する方向で検討してください。\n質問：サプライチェーン戦略担当が提案したマルチソーシング実現前に必要と述べたことは何ですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('設計資産の移植コストと歩留まり差を含む総所有コスト分析を先行させること',true,1),
  ('経済安全保障補助金の申請を完了させてからサプライヤー交渉を始めること',false,2),
  ('Samsung・国内ファウンドリーの品質認証を取得してから発注を開始すること',false,3),
  ('現行のTSMCとの契約を解除し、違約金を確定させること',false,4)
) AS t(txt,ok,so);

-- 問27 (正答:2) 水産業 — 漁業権と養殖振興の衝突
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n水産庁担当官：企業参入を促す養殖業振興のため、漁業権の一部を民間企業に開放する改正漁業法の運用を拡大したいのですが、既存漁業協同組合からの反発が続いています。漁協代表：先祖代々守ってきた漁場を企業に開放すれば、価格競争で零細漁師が廃業に追い込まれます。企業が参入するなら、地域漁師との共同経営や地元雇用の義務付けを条件にしなければ到底認められません。担当官：地域共生モデルを制度的に担保する仕組みの導入については前向きに検討します。\n質問：漁協代表が企業参入を認める条件として求めたものはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('企業参入による利益の50%を漁協に還元すること',false,1),
  ('地域漁師との共同経営と地元雇用の義務付け',true,2),
  ('企業参入を5年間の試験期間に限定し、その後再審査すること',false,3),
  ('養殖と天然漁業のエリアを完全に分離し競合を防ぐこと',false,4)
) AS t(txt,ok,so);

-- 問28 (正答:3) 宇宙開発 — 民間衛星の軌道混雑問題
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n宇宙政策研究者：低軌道の衛星数は過去5年で10倍以上に増加し、デブリとの衝突リスクが指数関数的に上昇しています。このままでは「ケスラーシンドローム」、すなわち連鎖的な衝突で軌道が使用不能になる最悪シナリオも排除できません。UN宇宙部代表：国際的な軌道登録制度と衛星寿命終了後25年以内の離軌処分ルールはありますが、法的拘束力に欠けます。商業衛星事業者への有効な制裁手段を持つ条約の交渉が急務です。\n質問：UN宇宙部代表が指摘した現行の軌道管理制度の問題はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('軌道登録制度が存在せず、民間衛星の位置情報が把握できていないこと',false,1),
  ('25年以内の離軌ルールが技術的に実現不可能な要求であること',false,2),
  ('離軌義務や登録制度はあるが法的拘束力が不十分なこと',true,3),
  ('ケスラーシンドロームが既に発生しており対処が手遅れであること',false,4)
) AS t(txt,ok,so);

-- 問29 (正答:4) 金融機関 — ESG投資基準の統一
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n資産運用会社ESG部長：ISSBのサステナビリティ開示基準が各国で採用段階に入りましたが、データプロバイダーによってESGスコアが大きく乖離しており、ポートフォリオ構築の際に混乱が生じています。年金基金CIO：スコアの方法論が非開示であれば比較可能性はゼロです。運用受託者として受益者に対する説明責任を果たすには、スコア算定根拠の開示を義務付けるよう規制当局に働きかけるべきだと思います。ESG部長：投資家連合を通じた共同声明も有効な手段です。\n質問：年金基金CIOがESGスコアの問題解決に向けて提案した行動はどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('ISSBの基準を採用している国の企業のみに投資対象を絞ること',false,1),
  ('ESGスコアを独自に算定する内製システムを構築すること',false,2),
  ('データプロバイダーとの契約を打ち切り、個別企業の開示情報のみを参照すること',false,3),
  ('スコア算定根拠の開示義務付けを規制当局に働きかけること',true,4)
) AS t(txt,ok,so);

-- 問30 (正答:1) 企業倫理 — 内部告発者保護の限界
WITH q AS (
  INSERT INTO quiz_questions (id, quiz_id, question_type, question_text, question_category, points, is_published)
  VALUES (gen_random_uuid(), 'bb000001-0000-0000-0000-000000000003', 'multiple_choice',
    E'次の会話を聴いて、質問に答えてください。\n弁護士（内部告発者代理）：依頼人は製品の品質偽装を社内通報窓口に報告した後、担当部署から閑職への異動を命じられました。公益通報者保護法が適用される案件ですが、「不利益取扱い」の立証において、異動の業務上の合理性が争点になります。コンプライアンス研究者：内部通報から異動まで3か月という短い期間、業績への悪影響がない点などが不利益取扱いの推認を支持する事情です。法が機能するには、企業側に「通報と無関係」の証明責任を転換すべきでしょう。\n質問：コンプライアンス研究者が不利益取扱いの推認を支持する事情として挙げたものはどれですか。',
    'listening', 1, true)
  RETURNING id)
INSERT INTO quiz_question_options (question_id, option_text, is_correct, sort_order)
SELECT id, t.txt, t.ok, t.so FROM q CROSS JOIN (VALUES
  ('通報から異動まで3か月という短期間であり、業績への悪影響がなかったこと',true,1),
  ('異動先の部署が担当者の専門性と完全に一致していること',false,2),
  ('会社が通報窓口の存在を社員に周知していなかったこと',false,3),
  ('内部通報の内容が外部メディアに漏洩していたこと',false,4)
) AS t(txt,ok,so);
