Feature: Weekly regression tests


  @SocialShare
  Scenario Outline:903 Check share on FB & Twitter from booking path calender page
    Given the user is on <lang> landing page
    When user tries to login with twitter
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he select random travel dates
    Then social share buttons displayed on booking path page
    #Then booking path page social share button names are correct
    And  user try to share content on facebook from booking page
    Then default FB share text is correct on Proposal page
    And user can post the content to fb page
    When  twitter share button is clicked on proposal page
    Then default twitter share text is correct on Proposal page
    And user can login and post the content to twitter page

    Examples:

      | lang    | From   | To      | Pax | tripType     |
      | English | London | Paris   | 1   | Return trip  |
      | English | London | Paris   | 1   | One way      |
      | French  | Paris  | Londres | 2   | Aller simple |
      | Dutch   | Londen | Brussel | 3   | Enkele reis  |


  Scenario Outline:903 Check share on FB & Twitter from booking confirmation page
    Given the user is on <lang> landing page
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
    And confirmation page social share buttons displayed
    Then confirmation page social share button names are correct
    And  user try to share content on facebook from confirmation page
    Then default confirmation page FB share text is correct
    And user can post the content to fb page
    When  twitter share button is clicked on confirmation page
    Then confirmation page twitter <lang> share text should be correct
    And user can login and post the content to twitter page


    Examples:

      | Test case | lang    | From   | To      | Pax | tripType     | Firstname  | Lastname | Card type | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country        | email                         |
      | 1         | English | London | Paris   | 1   | Return trip  | autotester | surname  | VISA      | 4929498311405001 | 12           | 2018        | 123 | E62EE    | United Kingdom | automation.tester55@gmail.com |
      | 2         | French  | Paris  | Londres | 2   | Aller simple | autotester | surname  | VISA      | 4937370000000015 | 12           | 2018        | 123 | 1235     | France         | automation.tester55@gmail.com |
      | 3         | Dutch   | Londen | Brussel | 3   | Enkele reis  | autotester | surname  | VISA      | 4937370000000015 | 09           | 2018        | 123 | 1235     | Belgium        | automation.tester55@gmail.com |


  @SocialShare
  Scenario Outline:904 Check deep linking option for Sold Out Scenario
    Given the user is on <lang> landing page
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    And he deeplink to the Sold-Out link <JourneyType> for <tripType>
    And he navigates to correct <Expected> booking page
    Examples:
      | lang    | From         | To     | Pax | JourneyType | tripType    | Expected |
      | English | Lille Europe | London | 4   | Outbound    | One way     | D8       |
      | English | Lille Europe | London | 4   | Outbound    | Return trip | D8       |


  @SocialShare
  Scenario Outline:904 Check deep linking option from booking path calendar using fb login
    Given the user is on <lang> landing page
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
#    And he deeplink to the not available <JourneyType> for <tripType> -- to be completed
    #deeplink href verification
    And he navigates to correct <Expected> booking page
# deeplink new page url verification
    Examples:
      | lang    | From          | To      | Pax | JourneyType | tripType           | Expected |
      | English | Lille Europe  | London  | 4   | Outbound    | One way            | D8       |
      | English | Lille Europe  | London  | 4   | Outbound    | Return trip        | D8       |

      | French  | Bruxelles     | Londres | 4   | Outbound    | Aller-retour       | D7       |
      | French  | Bruxelles     | Londres | 4   | Outbound    | Aller simple       | D7       |


      | Dutch   | Rijsel Europe | Londen  | 4   | Outbound    | Heen- en terugreis | D7       |
      | Dutch   | Rijsel Europe | Londen  | 4   | Outbound    | Enkele reis        | D7       |


#     | Dutch   | Rijsel Europe | Londen  | 2   | Inboud   | Heen- en terugreis     |D7      |  todo fix this to click on inbound NA date
#     | French  | London       | Paris   | 2   | Inboud      | Aller-retour | D7       |  todo fix this to click on inbound NA date
#     | English | Brussels     | London  | 2   | Inboud      | Return trip  | D8       |  todo fix this to click on inbound NA date







