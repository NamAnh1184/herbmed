import os, json, pickle
import numpy as np

SAVE_DIR = "./saved_model"  # sửa nếu cần

def load_pickle(path):
    with open(path, "rb") as f:
        return pickle.load(f)

def main():
    print("ABS SAVE_DIR:", os.path.abspath(SAVE_DIR))
    assert os.path.isdir(SAVE_DIR), "Không thấy thư mục saved_model"

    # metadata
    meta_path = os.path.join(SAVE_DIR, "model_metadata.json")
    if os.path.exists(meta_path):
        meta = json.load(open(meta_path, "r", encoding="utf-8"))
        print("Metadata keys:", list(meta.keys()))

    # data_loader.json
    dl_path = os.path.join(SAVE_DIR, "data_loader.json")
    dl = json.load(open(dl_path, "r", encoding="utf-8"))
    print("DataLoader keys:", list(dl.keys()))
    print("diseases:", len(dl.get("disease_names", {})))
    print("docs:", len(dl.get("docs", [])))
    print("qa_bank_flat:", len(dl.get("qa_bank_flat", [])))

    # embedding_cache.pkl
    emb_cache_path = os.path.join(SAVE_DIR, "embedding_cache.pkl")
    emb_cache = load_pickle(emb_cache_path)
    print("\nembedding_cache type:", type(emb_cache), "len:", len(emb_cache) if hasattr(emb_cache, "__len__") else "NA")

    # sample embedding
    if isinstance(emb_cache, dict) and len(emb_cache) > 0:
        k = next(iter(emb_cache.keys()))
        v = np.array(emb_cache[k])
        print("sample key:", str(k)[:80])
        print("sample embedding shape:", v.shape, "dtype:", v.dtype)

    # qa embeddings file name (đúng theo file bạn đang có)
    qa_path = os.path.join(SAVE_DIR, "qa_embbedings.pkl")  # <-- chú ý tên file
    assert os.path.exists(qa_path), f"Không thấy file {qa_path}"
    qa_emb = load_pickle(qa_path)
    qa_np = np.array(qa_emb)
    print("\nqa_embbedings type:", type(qa_emb))
    print("qa embeddings shape:", qa_np.shape, "dtype:", qa_np.dtype)

    print("\n✅ Tất cả file load OK!")

if __name__ == "__main__":
    main()
