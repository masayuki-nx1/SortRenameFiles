# ユーザーにディレクトリのパスを入力させる
$directory = Read-Host "ディレクトリを入力してください"

# 指定されたディレクトリ内のファイルを取得し、最終更新日時でソートする
$files = Get-ChildItem -File $directory | Sort-Object LastWriteTime

# 連番カウンターの初期値を設定
$counter = 1

# すべてのファイルに対してループ処理を行う
foreach ($file in $files) {
    # 新しいファイル名を連番付きで生成
    $newFileName = "{0:D2}_{1}" -f $counter, $file.Name
    # 新しいファイルパスを生成
    $newFilePath = Join-Path -Path $directory -ChildPath $newFileName
    # ファイル名を変更する
    Rename-Item -Path $file.FullName -NewName $newFilePath
    # カウンターをインクリメント
    $counter++
}
