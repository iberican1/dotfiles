import requests

response = requests.get('https://www.bbc.com/news')

print(response.status_code)

from bs4 import BeautifulSoup

soup = BeautifulSoup(response.content, 'html.parser')

print(soup)
