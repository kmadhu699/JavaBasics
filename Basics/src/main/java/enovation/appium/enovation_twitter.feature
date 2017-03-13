Feature: EnovationTwitter


  @snap @twitter
  Scenario Outline:901 A valid twitter user can log into enovation UI
    Given the user is on <lang> landing page
    When user tries to login with twitter
    Then his twitter account display name present on the home page

    Examples:
      | lang    |
      | English |
      | French  |
      | Dutch   |

  @snap @twitter
  Scenario Outline:901 Check proposals using Twitter login
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

  @sanity_2@twitter
  Scenario Outline:281 User do full booking with different combinations using twitter login
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
    And the user should receive an email
    Examples:

      | Test case | Language | From   | To      | Pax | tripType     | Outbound Timeslot | Inbound Timeslot | Outbound | Inbound | Firstname  | Lastname | Card type | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country        | email                         | Booking Reference   | Confirmation email | PNR |
      | 1         | English  | London | Paris   | 1   | Return trip  | pm                | pm               | 10 Jun   | 17 Jun  | autotester | surname  | VISA      | 4929498311405001 | 12           | 2018        | 123 | E62EE    | United Kingdom | automation.tester55@gmail.com | EN01-PQ5V-WBLW-FZG1 | Y                  | Y   |
      | 2         | French   | Paris  | Londres | 2   | Aller simple | pm                | pm               | 5 juin   | 7 juin  | autotester | surname  | VISA      | 4937370000000015 | 12           | 2018        | 123 | 1235     | France         | automation.tester55@gmail.com | EN01-W4TY-FV6C-EWGU | Y                  | Y   |
      | 3         | Dutch    | Londen | Brussel | 3   | Enkele reis  | pm                | pm               | 5 jun.   | 7 jun.  | autotester | surname  | VISA      | 4937370000000015 | 09           | 2018        | 123 | 1235     | Belgium        | automation.tester55@gmail.com | Y                   | Y                  | Y   |


  @SocialShare
  Scenario Outline:903 Check post to facebook option from Landing page
    Given the user is on <lang> landing page
    Then correct text should be displayed on fb Share button
    When fb share button is clicked
    And user logins into fb using share window
    Then default fb share text should be default_share_text
    And user can post the content to fb page
    Examples:
      | lang    |
      | English |
      | French  |
      | Dutch   |

  #todo fix the last step
  @SocialShare
  Scenario Outline:903 Check cancel post to facebook from Landing page
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

  @SocialShare
  Scenario Outline:903 Check post to twitter option from Landing page
    Given the user is on <lang> landing page
    Then correct text should be displayed on twitter Share button
    When twitter share button is clicked
    Then default twitter <lang> share text should be default_share_text
    And user can login and post the content to twitter page
    Examples:
      | lang    |
      | English |
      | French  |
      | Dutch   |

  @SocialShare
  Scenario Outline:904 Check post to facebook option from booking path calendar using fb login
    Given the user is on <lang> landing page
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he selects the travel dates
    Then fb and twitter share buttons should be displayed
    And the default share content using fb from booking path should be correct
#    And customer can the content to facebook page
    Examples:
      | lang    | From    | To      | Pax | tripType           |
      | English | London  | Paris   | 1   | Return trip        |
      | French  | Paris   | Londres | 2   | Aller simple       |
      | Dutch   | Brussel | Londen  | 2   | Heen- en terugreis |


  @SocialShare
  Scenario Outline:904 Check post to twitter option from booking path calendar using fb login
    Given the user is on <lang> landing page
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he selects the travel dates
    Then fb and twitter share buttons should be displayed
#    And the default share content using twitter from booking path should be correct
#    And customer can the content to twitter page

    Examples:
      | lang    | From    | To      | Pax | tripType           |
      | English | London  | Paris   | 1   | Return trip        |
      | French  | Paris   | Londres | 2   | Aller simple       |
      | Dutch   | Brussel | Londen  | 2   | Heen- en terugreis |


  @SocialShare
  Scenario Outline:904 Check post to facebook option from booking path calendar using twitter login
    Given the user is on <lang> landing page
    When user tries to login with twitter
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he selects the travel dates
    Then fb and twitter share buttons should be displayed
    And the default share content using fb from booking path should be correct
#    And customer can the content to facebook page


    Examples:
      | lang    | From    | To      | Pax | tripType           |
      | English | London  | Paris   | 1   | Return trip        |
      | French  | Paris   | Londres | 2   | Aller simple       |
      | Dutch   | Brussel | Londen  | 2   | Heen- en terugreis |


  @SocialShare
  Scenario Outline:904 Check post to twitter option from booking path calendar using twitter login
    Given the user is on <lang> landing page
    When user tries to login with twitter
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he selects the travel dates
    Then fb and twitter share buttons should be displayed
#    And the default share content using twitter from booking path should be correct
#    And customer can the content to twitter page

    Examples:
      | lang    |   From  | To       | Pax |  tripType          |
      | English | London  | Paris    | 1   | Return trip        |
      | French  | Paris   | Londres | 2   | Aller simple       |
      | Dutch   | Brussel | Londen  | 2   | Heen- en terugreis |
