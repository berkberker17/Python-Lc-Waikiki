*** Settings ***
Documentation    Suite description
Resource    ../Resources/po/proje.robot
*** Keywords ***
check the result
    proje.create session
    proje.click login button
    proje.click search button
    proje.scroll down
    proje.click search pantolon
    proje.close session