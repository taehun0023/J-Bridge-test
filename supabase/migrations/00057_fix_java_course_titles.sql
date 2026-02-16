-- Fix SILVER-04 course title/description to Japanese
UPDATE courses SET
  title = '例外処理',
  description = '例外階層、処理・伝播戦略、リソース解放パターンを理解し実務で活用する。'
WHERE id = '1a62e5bc-996b-4e1d-a6df-88a1aba2d719';
