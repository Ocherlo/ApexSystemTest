*** SETTINGS ***
Library    SeleniumLibrary
Resource    VariablesUI.robot
Resource    Resources.robot
*** Variable ***
${URL}=    https://www.liverpool.com.mx/tienda/home
${inputSearch}    id=mainSearchbar
${searchbtn}    xpath=//*[@id="__next"]/header/div[4]/div[2]/div/div/div/div[3]/div/div/div/button
${searchmodal}    xpath=//*[@id="__next"]/header/div[4]/div[2]/div/div/div/div[3]/div[2]
${firstResult}    xpath=//*[@id="__next"]/header/div[4]/div[2]/div/div/div/div[3]/div[2]/div/div/div[2]/ul/li[6]/div/a/figure
${purchaseaside}    xpath=//*[@id="__next"]/div[1]/section[1]/div/aside
${nullproducttxt}    xpath=//*[@id="__next"]/div[1]/div/div[2]/div/div[1]/div/div/div[1]/p
${productList}    xpath=//*[@id="__next"]/div[1]/div[1]/div/div[4]/main/div[2]/div/div
${setRange}    id=variants.prices.sortPrice-5000-10000
${filterBrand}    id=search-filter-brands
${brand}    id=brand-LG
${selectTV}    xpath=//*[@id="__next"]/div[1]/div[1]/div/div[4]/main/div[2]/div/div/ul/li[1]/a/div/figure/figcaption
${tvview}    xpath=//*[@id="__next"]/div[1]/section[1]/div/main/div[1]/div/figure/div[2]
*** Keywords ***
SEARCH PRODUCT
    [Documentation]    Keyword to search product
    [Arguments]    ${text}
    Element Should be Visible    ${inputSearch}
    Input Text    ${inputSearch}    ${text}
    Wait Until Element Is Visible    ${searchmodal}    5
*** TEST CASES ***
TC01-SEARCH_FIELD
    [Documentation]    Search product
    Open Browser    ${URL}    chrome
    Go To    ${URL}
    Maximize Browser Window
    Element Should be Visible    ${inputSearch}
    Input Text    ${inputSearch}    TV
    Click button    ${searchbtn}
    Wait Until Element Is Visible    ${searchmodal}    5
TC02-SELECT_TV
    [Documentation]    Search a tv and buy
    Go To    ${URL}
    SEARCH PRODUCT    xbox serie s
    Click element    ${firstResult}
    Wait Until Element Is Visible    ${purchaseaside}    5
TC03-SEARCH_PRODUCT_WITHOUT_RESULTS
    [Documentation]    Search a product without results
    Go To    ${URL}
    SEARCH PRODUCT    abcdefghi
    Click Element    ${searchbtn}
    Wait Until Element Is Visible    ${nullproducttxt}    5
TC04-SELECT_TV_BY_RANGE
    [Documentation]    Select a tv according a range of price and select if has discount
    Go To    ${URL}
    SEARCH PRODUCT    TV
    Press Keys    ${inputSearch}    ENTER
    Wait Until Element Is Visible    ${productList}    10
    Set Focus To Element    ${setRange}
    Click Element    ${setRange}
    Input Text    ${filterBrand}    LG
    Click Element    ${brand}
    Click Element    ${selectTV}
    Wait Until Element Is Visible    ${selectTV}    5
    Click Element    ${selectTV}
    Wait Until Element Is Visible    ${tvview}    5