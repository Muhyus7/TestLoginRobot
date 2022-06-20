*** Settings ***
Library                         SeleniumLibrary 
Suite Setup                     Open Browser                            ${base_url}     ${browser_type}
Suite Teardown                  Close Browser

*** Variables ***
${base_url}                     https://pub-eish-dev.keponet.com/frontend/login
${browser_type}                 firefox
${email_user}                   jenareishsatu@yopmail.com
${password_user}                12345678
${invalid_user}                 typoeishsatu@yopmail.com
${invalid_password}             87654321 

*** Test Case ***
I TRYING LOGIN WITH INVALID EMAIL AND VALID PASSWORD
    Maximize Browser Window
    Input Text                          //input[@id="email"]                                ${invalid_user}
    Input Text                          //input[@id="password"]                             ${password_user}
    Click Element                       //button[@class="btn btn-primary"]
    Element Should Not Contain          //input[@id="email"]                                ${email_user} 

I TRYING LOGIN WITH VALID EMAIL AND INVALID PASSWORD
    Maximize Browser Window
    Input Text                          //input[@id="email"]                                ${email_user}              
    Input Text                          //input[@id="password"]                             ${invalid_password}                                 
    Click Element                       //button[@class="btn btn-primary"]
    Page Should Contain                 Email yang dimasukkan atau password salah, silahkan cek input anda.

I AM LOGIN WITH VALID EMAIL AND VALID PASSWORD
    Maximize Browser Window
    Input Text                      //input[@id="email"]                                ${email_user}
    Input Text                      //input[@id="password"]                             ${password_user} 
    Click Element                   //button[@class="btn btn-primary"]
    Element Should Be Visible       //img[@id="menu-logo"]


