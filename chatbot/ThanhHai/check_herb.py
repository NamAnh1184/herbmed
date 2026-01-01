import json

data = json.load(open('saved_model/data_loader.json', encoding='utf-8'))
qa = data.get('qa_bank_flat', [])
herbs = [q for q in qa if q.get('intent') == 'herb']

print(f'Total QA: {len(qa)}')
print(f'Herb QA: {len(herbs)}')
print('\nSample herb QA:')
for h in herbs[:10]:
    print(f"  - {h['question'][:70]}...")
