#Tags Dictionary 

##Tags Options
    *Pre Defined Tags - In case the  elements are tot coplex to add a bo tag, custom selectrs can be defined in 
    'steps.defenitions\tags\selectors'
         Syntax to get the final bo tag selector
         ~ Beginning of predefined tag
         : Element name 
         | Parameter
         Example:
          When Tag "~grid:row|5" click


##Given
    * Navigated "target"
       - Navigates the browser to url ot "section" (hashtag) 
       - Example:  Navigated to Section "login" 
    * Tags Present "tag name" 
       - Validates that the tags are present on the screen before executing the bisness logic
       - Example: Tags "username,password,Log In" Present
    
##When
    * When Tag "tag name" set "tag value" 
       - Inputs the value ("tag value") into input element tagged with the tag ("tag name")
       - Example: Tag "username" set "incorrect@wolfman.com"  
    * When Tag "tag name" click
        - Clicks the element taged with "tag name"
        - Example: Tag "Log In" click   

##Then
    * Navigated to Section
        - Test if the browser is on url ot "section"(hashtag)
        - Example: Navigated to Section "api-list"  

#Tags Scenario Examples 
####Bad Scenario
<pre>
   Scenario: Login fails using the incorrect username
    When I enter username:"incorrect@wolfman.com", password:"bp3luser"
    And I click the "Log In" button
    Then The Error Message is: "Login failed: The user credentials are incorrect"
</pre>
    
####Good Scenario
<pre>
   Scenario:  Login fails using the incorrect username : By Tag operations
    Given Navigated to Section "login"
        And Tags "username,password,Log In" Present
    When Tag "username" set "incorrect@wolfman.com"
        And Tag "password" set "bp3luser"
        And Tag "Log In" click
    Then Navigated to Section "api-list"
        And Tag "api-grid" displayed    
</pre>
    
