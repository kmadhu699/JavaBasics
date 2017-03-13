Feature: snap phase 2 testing pack

  @phase2 @pass1
  Scenario Outline:701 A valid twitter user can log into Snap
    Given the user is on <lang> landing page
    When user tries to login with twitter
    Then his twitter account display name present on the home page

    Examples:
      | lang    |
      | English |
      | French  |
      | Dutch   |

  @phase2 @pass1
  Scenario Outline:702 Check default travel details are correct using twitter login
    Given the user is on <Language> landing page
    When user tries to login with twitter
    When he is in availability page
    Then default travel details are correct
    Examples:

      | Language |
      | English  |
      | French   |
      | Dutch    |

  @snapRegressionTest @phase2 @pass1
  Scenario Outline:703 User do full booking with different combinations using Twitter login
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
#    Then booking confirmation page should be shown

    Examples:

      | Test case | Language | From   | To      | Pax | tripType     | Firstname  | Lastname | Card type | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country        | email                         |
      | 1         | French   | Paris  | Londres | 2   | Aller simple | autotester | surname  | VISA      | 4937370000000015 | 12           | 2018        | 123 | 1235     | France         | automation.tester55@gmail.com |
      | 2         | English  | London | Paris   | 1   | Return trip  | autotester | surname  | VISA      | 4929498311405001 | 12           | 2018        | 123 | E62EE    | United Kingdom | automation.tester55@gmail.com |
      | 3         | Dutch    | Londen | Brussel | 3   | Enkele reis  | autotester | surname  | VISA      | 4937370000000015 | 09           | 2018        | 123 | 1235     | Belgium        | automation.tester55@gmail.com |


  @snapRegressionTest @phase2 @pass1
  Scenario Outline:704 Check proposals using Twitter login
    Given the user is on <lang> landing page
    When user tries to login with twitter
    When he is in availability page
    And proceed with default values
    Then he should see proposals

    Examples:
      | lang    |
      | English |
      | French  |
      | Dutch   |

  @SocialShare @phase2 @pass1
  Scenario Outline:705 Check share on facebook option from Landing page
    Given the user is on <lang> landing page
    Then correct text should be displayed on fb Share button
    When fb share button is clicked
    And user logins into fb using share window
    Then default fb share text should be default_share_text
#    And user can post the content to fb page
    Examples:
      | lang    |
      | French  |
      | English |
      | Dutch   |


  @SocialShare @phase2 @pass1
  Scenario Outline:706 check cancel share on facebook from Landing page
    Given the user is on <lang> landing page
    Then correct text should be displayed on fb Share button
    When fb share button is clicked
    And user logins into fb using share window
    Then default fb share text should be default_share_text
    And user can cancel post to fb page
    Examples:
      | lang    |
      | English |
      | French  |
      | Dutch   |

  @SocialShare @phase2  @pass1
  Scenario Outline:707 Check share on twitter from Landing page
    Given the user is on <lang> landing page
    Then correct text should be displayed on twitter Share button
    When twitter share button is clicked
    Then default twitter <lang> share text should be default_share_text
#    And user can login and post the content to twitter page
    Examples:
      | lang    |
      | French  |
      | English |
      | Dutch   |

  @SocialShare @phase2 @pass1
  Scenario Outline:708 Check share on FB & Twitter from booking confirmation page using FB login
    Given the user is on <lang> landing page
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
    And confirmation page social share buttons displayed
    Then confirmation page social share button names are correct
    And  user try to share content on facebook from confirmation page
    Then default confirmation page FB share text is correct
    And user can post the content to fb page
    When  twitter share button is clicked on confirmation page
    Then confirmation page twitter <lang> share text should be correct
#    And user can login and post the content to twitter page

    Examples:

      | lang    | From   | To      | Pax | tripType     | Firstname  | Lastname | Card type        | Card Number      | Expiry Month | Expiry Year | CVV  | postcode | country        | email                         |
      | English | London | Paris   | 1   | Return trip  | autotester | surname  | American Express | 374290482911992  | 12           | 2018        | 1234 | E62EE    | United Kingdom | automation.tester55@gmail.com |
      | French  | Paris  | Londres | 2   | Aller simple | autotester | surname  | VISA             | 4937370000000015 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com |
      | Dutch   | Londen | Brussel | 3   | Enkele reis  | autotester | surname  | Mastercard       | 5255000000000019 | 09           | 2018        | 123  | 1235     | Belgium        | automation.tester55@gmail.com |


  @SocialShare @phase2 @pass1
  Scenario Outline:709 Check share on FB & Twitter from booking confirmation page using Twitter login
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
#    And user can login and post the content to twitter page


    Examples:

      | Test case | lang    | From   | To      | Pax | tripType     | Firstname  | Lastname | Card type | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country        | email                         |
      | 1         | English | London | Paris   | 1   | Return trip  | autotester | surname  | VISA      | 4929498311405001 | 12           | 2018        | 123 | E62EE    | United Kingdom | automation.tester55@gmail.com |
      | 2         | French  | Paris  | Londres | 2   | Aller simple | autotester | surname  | VISA      | 4937370000000015 | 12           | 2018        | 123 | 1235     | France         | automation.tester55@gmail.com |
      | 3         | Dutch   | Londen | Brussel | 3   | Enkele reis  | autotester | surname  | VISA      | 4937370000000015 | 09           | 2018        | 123 | 1235     | Belgium        | automation.tester55@gmail.com |

  @SocialShare @phase2 @pass1
  Scenario Outline:710 Check share on FB & Twitter from booking path calender page using twitter login
    Given the user is on <lang> landing page
    When user tries to login with twitter
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he select random travel dates
    Then social share buttons displayed on booking path page
    Then booking path page social share button names are correct
    And  user try to share content on facebook from booking page
    Then default FB share text is correct on Proposal page
    And user can post the content to fb page
    When  twitter share button is clicked on proposal page
    Then default twitter share text is correct on Proposal page
#    And user can login and post the content to twitter page

    Examples:

      | lang    | From   | To      | Pax | tripType     |
      | French  | Paris  | Londres | 2   | Aller simple |
      | Dutch   | Londen | Brussel | 3   | Enkele reis  |
      | English | London | Paris   | 1   | Return trip  |
      | English | London | Paris   | 1   | One way      |

  @SocialShare @phase2 @pass1
  Scenario Outline:711 Check share on FB & Twitter from booking path calender page using FB login
    Given the user is on <lang> landing page
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he select random travel dates
    Then social share buttons displayed on booking path page
    Then booking path page social share button names are correct
    And  user try to share content on facebook from booking page
    Then default FB share text is correct on Proposal page
    And user can post the content to fb page
    When  twitter share button is clicked on proposal page
    Then default twitter share text is correct on Proposal page
#    And user can login and post the content to twitter page

    Examples:

      | lang  | From   | To      | Pax | tripType    |
      | French  | Paris  | Londres | 2   | Aller simple |
      | English | London | Paris   | 1   | Return trip  |
      | English | London | Paris   | 1   | One way      |
      | Dutch | Londen | Brussel | 3   | Enkele reis |

  @phase2 @deeplink @pass1
  Scenario Outline:712 Check deep linking for not available tickets from booking path calendar using Facebook login
    Given the user is on <lang> landing page
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    And he deeplink to the not available <JourneyType> for <tripType>
    Then he should see proposals
    And he navigates to correct <Expected> booking page

    Examples:
      | lang    | From          | To      | Pax | JourneyType | tripType           | Expected |
      | English | Lille Europe  | London  | 4   | Outbound    | One way            | D8       |
      | English | Lille Europe  | London  | 4   | Outbound    | Return trip        | D8       |
      | French  | Bruxelles     | Londres | 4   | Outbound    | Aller-retour       | D7       |
      | French  | Bruxelles     | Londres | 4   | Outbound    | Aller simple       | D7       |
      | Dutch   | Rijsel Europe | Londen  | 4   | Outbound    | Heen- en terugreis | D7       |
      | Dutch   | Rijsel Europe | Londen  | 4   | Outbound    | Enkele reis        | D7       |

  @phase2 @deeplink @pass1
  Scenario Outline:713 Check deep linking for not available tickets from booking path calendar using Twitter login
    Given the user is on <lang> landing page
    When user tries to login with twitter
    And he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    And he deeplink to the not available <JourneyType> for <tripType>
    Then he should see proposals
    And he navigates to correct <Expected> booking page

    Examples:
      | lang    | From          | To      | Pax | JourneyType | tripType           | Expected |
      | English | Lille Europe  | London  | 4   | Outbound    | One way            | D8       |
      | English | Lille Europe  | London  | 4   | Outbound    | Return trip        | D8       |
      | French  | Bruxelles     | Londres | 4   | Outbound    | Aller-retour       | D7       |
      | French  | Bruxelles     | Londres | 4   | Outbound    | Aller simple       | D7       |
      | Dutch   | Rijsel Europe | Londen  | 4   | Outbound    | Heen- en terugreis | D7       |
      | Dutch   | Rijsel Europe | Londen  | 4   | Outbound    | Enkele reis        | D7       |

  @phase2 @deeplink @pass1
  Scenario Outline:714 Check deep linking  for Sold Out tickets
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


  @phase2 @deeplink
  Scenario Outline:903 Check  download tickets deeplinking
    Given the user is on <lang> landing page
    And user tries to login with twitter
    When he is in home page
    And he has tickets to download with valid PNR
    Then he can navigate to correct Eurostar MYB page

    Examples:
      | lang    |
      | English |
#TODO Fix the last step


