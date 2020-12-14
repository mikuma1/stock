class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: 'カテゴリーを選択してください' },
    { id: 1, name: '事務用品・文房具' },
    { id: 2, name: 'ファイル' },
    { id: 3, name: 'トナー・コピー用紙' },
    { id: 4, name: 'パソコン周辺機器' },
    { id: 5, name: '事務機器・電池・照明' },
    { id: 6, name: '生活雑貨' },
    { id: 7, name: '飲料・食料' },
    { id: 8, name: '衛生・医療' },
    { id: 9, name: 'テープ・梱包資材' },
    { id: 10, name: 'その他' }
  ]
end
