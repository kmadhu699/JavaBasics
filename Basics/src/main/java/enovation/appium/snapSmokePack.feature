Feature: snap smoke testing pack

  @snapSmokeTest @pass1
  Scenario Outline:901 A valid twitter user can log into Snap
    Given the user is on <lang> landing page
    When user tries to login with twitter
    Then his twitter account display name present on the home page

    Examples:
      | lang    |
      | English |
      | French  |
      | Dutch   |

  @snapSmokeTest @pass1
  Scenario Outline:902 A valid facebook user can log into enovation UI
    Given the user is on <lang> landing page
    When user tires to login with facebook
    Then his facebook account display name present on the home page

    Examples:
      | lang    |
      | English |
      | French  |
      | Dutch   |

  @snapSmokeTest @pass1
  Scenario Outline:903 Check default travel details are correct using twitter login
    Given the user is on <Language> landing page
    When user tries to login with twitter
    When he is in availability page
    Then default travel details are correct
    Examples:

      | Language |
      | English  |
      | French   |
      | Dutch    |


  @snapSmokeTest  @pass1
  Scenario Outline:904 Check default travel details are correct using FB login
    Given the user is on <Language> landing page
    When user tires to login with facebook
    When he is in availability page
    Then default travel details are correct
    Examples:

      | Language |
      | English  |
      | French   |
      | Dutch    |


  @snapSmokeTest @pass1
  Scenario:905 User can change languages
    Given the user is on English landing page
    Then the language should be "English"
    When change the language to "French"
    Then the language should be "French"
    When change the language to "Dutch"
    Then the language should be "Dutch"
    When I refresh the page
    Then the language should be "Dutch"

  @snapSmokeTest @pass1
  Scenario Outline:906 User do full booking with various combinations using FB login
    Given the user is on <Language> landing page
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he select random dates
    Then he should see payment page
    When he enter travel details as "<Firstname>" and "<Lastname>"
    Then payment options screen should be available
    When he enter payment details with "<Card type>" "<Card Number>", "<Expiry Month>","<Expiry Year>" and "<CVV>"
    Then the payment should be sucessfull
    And enters their billing address details with "<postcode>" "<country>" and "<email>"
    Then booking confirmation page should be shown

    Examples:

      | Language | From   | To      | Pax | tripType     | Firstname  | Lastname | Card type        | Card Number      | Expiry Month | Expiry Year | CVV  | postcode | country        | email                         |
      | English  | London | Paris   | 1   | Return trip  | autotester | surname  | American Express | 374290482911992  | 12           | 2018        | 1234 | E62EE    | United Kingdom | automation.tester55@gmail.com |
      | French   | Paris  | Londres | 2   | Aller simple | autotester | surname  | VISA             | 4937370000000015 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com |
      | Dutch    | Londen | Brussel | 3   | Enkele reis  | autotester | surname  | Mastercard       | 5255000000000019 | 09           | 2018        | 123  | 1235     | Belgium        | automation.tester55@gmail.com |


  @snapSmokeTest @pass1
  Scenario Outline:907 User do full booking with different combinations using Twitter login
    Given the user is on <Language> landing page
    When user tries to login with twitter
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he select random dates
    Then he should see payment page
    When he enter travel details as "<Firstname>" and "<Lastname>"
    Then payment options screen should be available
    When he enter payment details with "<Card type>" "<Card Number>", "<Expiry Month>","<Expiry Year>" and "<CVV>"
    Then the payment should be sucessfull
    And enters their billing address details with "<postcode>" "<country>" and "<email>"
    Then booking confirmation page should be shown

    Examples:

      | Language | From   | To      | Pax | tripType     | Firstname  | Lastname | Card type        | Card Number      | Expiry Month | Expiry Year | CVV  | postcode | country        | email                         |
      | English  | London | Paris   | 1   | Return trip  | autotester | surname  | American Express | 374290482911992  | 12           | 2018        | 1234 | E62EE    | United Kingdom | automation.tester55@gmail.com |
      | French   | Paris  | Londres | 2   | Aller simple | autotester | surname  | VISA             | 4937370000000015 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com |
      | Dutch    | Londen | Brussel | 3   | Enkele reis  | autotester | surname  | Mastercard       | 5255000000000019 | 09           | 2018        | 123  | 1235     | Belgium        | automation.tester55@gmail.com |

  @snapSmokeTest @run
  Scenario Outline:908 Deep link to main eurostar site from landing page
    Given the user is on <Language> landing page
    When I click on go to eurostar on landing page
    Then I should navigate to correct eurostar site

    Examples:

      | Language |
      | French   |
      | English  |
      | Dutch    |

  @snapSmokeTest @run1
  Scenario Outline:909 Travel details not prepopulated for twitter login
    Given the user is on <Language> landing page
    When user tries to login with twitter
#    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he select random dates
    Then he should see payment page
    And traveller details should not be prepopulated


    Examples:

      | Language | From   | To      | Pax | tripType     |
      | English  | London | Paris   | 1   | Return trip  |
      | French   | Paris  | Londres | 2   | Aller simple |
      | Dutch    | Londen | Brussel | 3   | Enkele reis  |
