from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
import time

driver = webdriver.Chrome(executable_path=r'C:\Windows\chromedriver.exe')
driver.get('https://www.liverpool.com.mx/tienda/home')
searchInput = driver.find_element(By.ID, "mainSearchbar")
searchBtn = driver.find_element(By.CLASS_NAME, "input-group-text")

searchInput.send_keys('TV')
searchInput.send_keys(u'\ue007')
time.sleep(5)