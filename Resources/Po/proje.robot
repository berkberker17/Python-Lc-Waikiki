*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    DebugLibrary


*** Variables ***
${HOMEPAGE}    https://www.lcwaikiki.com/tr-TR/TR
${BROWSER}    chrome
${E_MAIL}     berkco17@gmail.com
${PASSWORD}    berk1903

*** Keywords ***
create session
    open browser    ${HOMEPAGE}   ${BROWSER}
    maximize browser window
    wait until page contains element    xpath=//*[@id="header__container"]/div/header/div[2]/div/div[1]/a/img
click login button
    click element    xpath=//*[@id="header__container"]/div/header/div[2]/div/div[3]/div[2]/div[1]/a
    click element    id=id="LoginEmail"
    input text    id="LoginEmail"    ${E_MAIL}
    click element    id="Password"    ${PASSWORD}
    click element    id="loginLink"
    wait until page contains element    xpath=//*[@id="header__container"]/div/header/div[2]/div/div[3]/div[2]/div[1]/button/span
click search button
    click element    id="search_input"
    input text    id="search_input"    pantolon
scroll down
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
click search pantolon
    click element    xpath=//*[@id="divModels"]/div[7]/div/div[4]/a
    click element    xpath=//*[@id="model_1680794_5086659"]/div[1]/img[1]
    wait until page contains    LCW CLASSIC Dar Kalıp Gabardin Erkek Chino Pantolon
    click element    xpath=//*[@id="option-size"]/a[4]
    click element    xpath=//*[@id="option-height"]/a[4]
    ${ILAN}=    get text    xpath=//*[@id="rightInfoBar"]/div[1]/div/div[2]/div/div/div/span[2]
    click element    id="pd_add_to_cart"
    click element    id="spanCart"
    wait until page contains    Sepetim
    ${ILAN1}=    get text    xpath=//*[@id="ShoppingCartContent"]/div[1]/div[1]/div[2]/div[1]/div[1]/div[2]/span
    should be equal    ${ILAN1}    ${ILAN}    fiyat miktarı eşit.
    click element    id="Cart_AddQuantity_733951252"
    wait until page contains    Sepetim (2 Ürün)
    click element    id="Cart_ProductDelete_733951252"
close session
    close browser