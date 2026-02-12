import requests
from bs4 import BeautifulSoup

url = "https://en.wikipedia.org/wiki/IIT_Patna"

headers = {
    "User-Agent": "Mozilla/5.0"
}

response = requests.get(url, headers=headers)

soup = BeautifulSoup(response.text, "html.parser")

text = ""
for p in soup.find_all("p"):
    text += p.get_text()

words = text.split()
limited_text = " ".join(words[:1500])

with open("wiki.txt", "w", encoding="utf-8") as f:
    f.write(limited_text)

print("Scraping completed. Words scraped:", len(words[:1500]))
