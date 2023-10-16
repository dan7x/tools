from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.firefox.options import Options

SONA = "https://wlu-ls.sona-systems.com/default.aspx"
SONA_PROG = "https://wlu-ls.sona-systems.com/progress.aspx"
SONA_AVAIL = "https://wlu-ls.sona-systems.com/all_exp_participant.aspx"
MAX_TIMEOUT = 5


def observe(sona_usr, sona_pwd):
    options = Options()
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')  # Last I checked this was necessary.
    driver = webdriver.Firefox(options=options)

    driver.get(SONA)
    inputs = driver.find_elements(By.CLASS_NAME, "form-control")
    assert len(inputs) == 2
    input_usr = inputs[0]
    input_pwd = inputs[1]

    input_usr.send_keys(sona_usr)
    input_pwd.send_keys(sona_pwd)
    sleep(1)
    submit_btn = driver.find_element(By.CLASS_NAME, "default_auth_button")
    submit_btn.click()
    home_id = "ctl00_NonAdminNavigationBarUserControl_HomeLink"
    # WebDriverWait(driver, MAX_TIMEOUT).until(EC.presence_of_element_located((By.ID, home_id)))
    sleep(1)
    # Find completed
    driver.get(SONA_PROG)

    # data-title="Study"
    studies_completed_elms = driver.find_elements(By.XPATH, '//td[@data-title="Study"]')
    studies_completed = [e.find_element(By.TAG_NAME, "a").get_attribute("innerHTML") for e in studies_completed_elms]
    sleep(1)

    # Find currently avail
    driver.get(SONA_AVAIL)
    xp_av = "/html/body/form/div[3]/section/section/section/div[2]/div[2]/div/section/div/div/table"
    studies_avail_tbl = driver.find_element(By.XPATH, xp_av).find_element(By.TAG_NAME, "tbody")
    studies_avail_elms = studies_avail_tbl.find_elements(By.TAG_NAME, "tr")
    studies_avail = [
        x.find_elements(By.TAG_NAME, "td")[1].find_element(By.TAG_NAME, "a").get_attribute("innerHTML")
        for x in studies_avail_elms]
    driver.close()
    return list(set(studies_avail) - set(studies_completed)), studies_completed, studies_avail
