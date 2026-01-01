import pickle
import sys
sys.stdout.reconfigure(encoding='utf-8')

with open('saved_model/qa_embeddings.pkl', 'rb') as f:
    qa_emb = pickle.load(f)

print(f'Total embeddings: {len(qa_emb)}')

# Count by intent
intents = {}
for item in qa_emb:
    intent = item['qa'].get('intent', 'unknown')
    intents[intent] = intents.get(intent, 0) + 1

print('\nEmbeddings by intent:')
for intent, count in sorted(intents.items(), key=lambda x: -x[1]):
    print(f'  {intent}: {count}')

# Check if herb embeddings exist
herb_emb = [e for e in qa_emb if e['qa'].get('intent') == 'herb']
print(f'\nHerb embeddings: {len(herb_emb)}')
if herb_emb:
    print('Sample herb questions:')
    for h in herb_emb[:5]:
        q = h['qa'].get('question', '')[:60]
        print(f'  - {q}...')
