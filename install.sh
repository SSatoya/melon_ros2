mkdir -p assets

# Hugging Face Hubからファイルをダウンロード
echo "Downloading USD file from Hugging Face Hub..."

git lfs install
git clone https://huggingface.co/datasets/SSatoya/melon_usd assets/melon

echo "Download complete! Files are in 'assets/melon'."