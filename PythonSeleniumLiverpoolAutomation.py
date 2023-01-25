import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

#TEST CASE CREATE ACCOUNT
driver = webdriver.Chrome(executable_path=r'C:\Windows\chromedriver.exe')
driver.get('https://www.liverpool.com.mx/tienda/home')
driver.maximize_window()
login = driver.find_element(By.XPATH, "//*[@id='__next']/header/div[4]/div[2]/div/div/div/div[5]/span")
login.click()
wait = WebDriverWait(driver, 10)
element = wait.until(EC.visibility_of_element_located((By.ID, 'username')))
createaccount = driver.find_element(By.XPATH, "/html/body/code/main/section/div/div/div/div[1]/p/a").click()
inputmail = driver.find_element(By.ID,"email").send_keys('markucorde@gufum.com')
password = driver.find_element(By.ID, "password").send_keys('A12345678z')
createbtn = driver.find_element(By.NAME, "action").click()
loginpage = wait.until(EC.visibility_of_element_located((By.ID, 'loginPage')))

#TEST CASE CREATE ACCOUNT WITH EXISTING EMAIL
driver.get('https://www.liverpool.com.mx/tienda/home')
driver.maximize_window()
login = driver.find_element(By.XPATH, "//*[@id='__next']/header/div[4]/div[2]/div/div/div/div[5]/span")
login.click()
wait = WebDriverWait(driver, 10)
element = wait.until(EC.visibility_of_element_located((By.ID, 'username')))
createaccount = driver.find_element(By.XPATH, "/html/body/code/main/section/div/div/div/div[1]/p/a").click()
inputmail = driver.find_element(By.ID,"email").send_keys('markucorde@gufum.com')
password = driver.find_element(By.ID, "password").send_keys('A12345678z')
createbtn = driver.find_element(By.NAME, "action").click()
error = wait.until(EC.visibility_of_element_located((By.ID, 'error-element-email')))

driver.quit()
