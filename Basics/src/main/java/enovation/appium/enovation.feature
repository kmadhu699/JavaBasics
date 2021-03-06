Feature: Enovation

#  Scenario:275 A invalid facebook user cannot log into enovation UI
#
#    Given the user is in landing page
#    When user tires to login with facebook with invalid details
#    Then error message with invalid login should be shown
#    And user try to close the facebook popup
#    Then he should not be able to login

  @snap @twitter
  Scenario:276 A valid facebook user can log into enovation UI
    Given the user is in landing page
    When user tires to login with facebook
    Then he should be able to login with his first name displayed

  @debug @reg @snap
  Scenario:277 User can change languages

    Given user is in login page
    Then the language should be "English"
    When change the language to "French"
    Then the language should be "French"
    When change the language to "Dutch"
    Then the language should be "Dutch"
    When I refresh the page
    Then the language should be "Dutch"

  @snap @twitter
  Scenario:278 User logins through popup dialog box

    Given user is in home page
    When he logins with facebook
    Then he should be able to login with his first name displayed

  @snap
  Scenario:6746 Check proposals

    Given user is logged in to enovation app
    When change the language to "English"
    When he is in availability page
    And proceed with default values
    Then he should see proposals

  @reg @1 @snap
  Scenario Outline:279 Check proposals as per selection

    Given user is logged in to enovation app
    When change the language to "English"
    When he is in availability page
#    When user navigates to availability page
    And selects from "<from>" , "<to>" , "<passengerCount>" and "<tripType>"
#    And <passengerCount> passenger(s) travelling <from> to <to>
    Then he should see proposals as per selection
    #When he select first available dates and go to payments page
    When he select random dates
    Then he should see payment page

    Examples:

      | from     | to     | passengerCount | tripType    |
      | London   | Paris  | 2              | Return trip |
      | Paris    | London | 3              | One way     |
      | Brussels | London | 4              | Return trip |


  @sanity@snap
  Scenario:280 User do full booking with default value

    Given user is logged in to enovation app
    When change the language to "English"
    When he is in availability page
    And proceed with default values
    Then he should see proposals
    When he select random dates
   #When he select first available dates and go to payments page
    Then he should see payment page
    When he enter travel details
    Then payment options screen should be available
    When he enter default payment details
    Then the payment should be sucessfull
    And enter the defaul address details and proceed to book
    And check out details should be available
    Then booking confirmation page should be shown
    And the details of the booking matches the user selected options
    When I read the session Id
    And get PNR booked


#  sc: clicking on the eurostar snap logo directs you to the homepage
#  sc: need help link at the top right hand (which is not working and needs to be raised)
#  sc: login attempt with deleted or disabled facebook account
#  sc: if OD is not selected and user clicks continue then there should be a validation that forces the user to make a selection
#  sc: same as above for passengerCount numbers selection


  @env@sanity
  Scenario Outline:222 User do full booking with different destinations

    Given user is logged in to enovation app
    When change the language to "English"
    When he is in availability page
    And selects from "<from>" , "<to>" , "<passengerCount>" and "<tripType>"
    Then he should see proposals
    When he select random dates
    Then he should see payment page
    When he enter travel details
    Then payment options screen should be available
    When he enter default payment details
    Then the payment should be sucessfull
    And enter the defaul address details and proceed to book
    And check out details should be available
    Then booking confirmation page should be shown
    And the details of the booking matches the user selected options

    Examples:

      | from     | to       | passengerCount | tripType    | slot_out | outbound | slot_in | inbound |
      | London   | Paris    | 2              | Return trip | pm       | 21 May   | pm      | 24  May |
      | London   | Paris    | 3   | One way     | pm       | 21 May   | pm      | 4 Jun   |
      | Paris    | London   | 1   | One way     | pm       | 21 May   | pm      | 4 Jun   |
      | London   | Brussels | 2   | Return trip | pm       | 21 May   | pm      | 4 Jun   |
      | Brussels | London   | 3   | Return trip | pm       | 21 May   | pm      | 21 May  |
      | London   | Brussels | 2   | One way     | pm       | 21 May   | pm      | 21 May  |
      | Brussels | London   | 2   | One way     | pm       | 21 May   | pm      | 21 May  |


  @env@sanity@patch1@snap
  Scenario Outline:User can book with different card types

    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<from>" , "<to>" , "<passengerCount>" and "<tripType>"
    Then he should see proposals
    When he select random dates
    Then he should see payment page
    When he enter travel details
    Then payment options screen should be available
    When he enter payment details with "<card type>" "<card>", "<examonth>","<expyear>" and "<cvv>"
    Then the payment should be sucessfull
    And enter the defaul address details with country "<Country>" and proceed to book
    Then booking confirmation page should be shown

    Examples:

      | from   | to     | passengerCount | tripType    | card type        | card             | examonth | expyear | cvv  | Country        | Result |
      | London | Paris  | 2              | Return trip | VISA             | 4929498311405001 | 12       | 2018    | 123  | United Kingdom |        |
#     | London | Paris  | 2   | Return trip | VISA Delta       | 4929498311405001 | 12       | 2018    | 123  | United Kingdom |        |   VISA Delta -- Not available
      | London | Paris  | 2              | One way     | VISA Electron    | 4459589999014202 | 12       | 2018    | 123  | United Kingdom |        |
      | Paris  | London | 2              | One way     | Mastercard       | 5255000000000019 | 12       | 2018    | 123  | United Kingdom |        |
      | Paris  | London | 2              | Return trip | American Express | 374290482911992  | 12       | 2018    | 1234 | United Kingdom | P      |
      | Paris  | London | 2              | One way     | Debit Mastercard | 5255000000000019 | 12       | 2018    | 123  | Spain          | P      |


  @env@sanity
  Scenario Outline:281 User do full booking with various combinations

    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<from>" , "<to>" , "<passengerCount>" and "<tripType>"
    Then he should see proposals
    When he select random dates
    Then he should see payment page
    When he enter travel details as "<firstnames>" and "<lastnames>"
    Then payment options screen should be available
    When he enter payment details with "<card Type>" "<card>", "<examonth>","<expyear>" and "<cvv>"
    Then the payment should be sucessfull
    And enter the defaul address details and proceed to book
    Then booking confirmation page should be shown

    Examples:

      | from   | to     | passengerCount | tripType    | slot_out | outbound | slot_in | inbound | firstnames | lastnames | card Type | card             | examonth | expyear | cvv | Country        |
      | London | Paris  | 2              | Return trip | pm       | 21 May   | pm      | 4 Jun   | autotester | surname   | VISA      | 4929498311405001 | 12       | 2018    | 123 | United Kingdom |
      | London | Paris  | 2              | One way     | pm       | 21 May   | pm      | 4 Jun   | autotester | surname   | VISA      | 4929498311405001 | 12       | 2018    | 123 | United Kingdom |
      | Paris  | London | 2              | One way     | pm       | 21 May   | pm      | 4 Jun   | autotester | surname   | VISA      | 4929498311405001 | 12       | 2018    | 123 | United Kingdom |

    #todo fix enter title at default address


  @e2e@patch
  Scenario Outline:281 User do full booking with various combinations

    Given the user is in landing page
    When change the language to "<Language>"
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<passengerCount>" and "<tripType>"
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
  @e2e
    Examples:

      | Test case                 | Language | From     | To       | passengerCount | tripType    | Outbound Timeslot | Inbound Timeslot | Outbound | Inbound | Firstname   | Lastname | Card type        | Card Number      | Expiry Month | Expiry Year | CVV  | postcode | country        | email                         | Booking Reference   | Confirmation email | PNR |
      | 1                         | English  | London   | Paris    | 1              | Return trip | pm                | pm               |          | 17 Jun  | autotester  | surname  | VISA             | 4929498311405001 | 12           | 2018        | 123  | E62EE    | United Kingdom | automation.tester55@gmail.com | EN01-PQ5V-WBLW-FZG1 | Y                  | Y   |
      | 2                         | English  | Paris    | London   | 3              | Return trip | pm                | pm               |          | 17 Jun  | autotester  | surname  | VISA Electron    | 4937370000000015 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com | EN01-P9Z3-TAC5-5FFJ | Y                  | Y   |
      | 3                         | English  | London   | Brussels | 2              | Return trip | pm                | pm               |          | 8 Jun   | autotester  | surname  | VISA             | 4929498311405001 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com | Y                   | Y                  | Y   |
      | 4                         | English  | Brussels | London   | 4              | Return trip | pm                | pm               |          | 8 Jun   | autotester  | surname  | VISA Delta       | 4539792000000004 | 12           | 2018        | 123  | 12121    | Spain          | automation.tester55@gmail.com | EN01-LZKI-IU4C-H39T | Y                  | Y   |
      | 5                         | English  | London   | Paris    | 4              | One way     | pm                | pm               |          | 8 Jun   | autotester  | surname  | American Express | 374290482911992  | 12           | 2018        | 1234 | ABA11    | Belgium        | automation.tester55@gmail.com | Y                   | Y                  | Y   |
      | 6                         | English  | London   | Brussels | 3              | One way     | pm                | pm               |          | 8 Jun   | autotester  | surname  | Mastercard       | 5255000000000019 | 12           | 2018        | 123  | 560001   | India          | automation.tester55@gmail.com | EN01-1Y3F-W4YI-ACEX | Y                  | Y   |
      | 7                         | English  | Brussels | London   | 1              | One way     | pm                | pm               |          | 8 Jun   | autotester  | surname  | Debit Mastercard | 5573480000000190 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com | EN01-3SV6-XM9F-NIT5 | Y                  | Y   |
      | 8                         | English  | Paris    | London   | 2              | One way     | pm                | pm               |          | 17 Jun  | autotester  | surname  | VISA Electron    | 4937370000000015 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com | EN01-QYGC-JXK7-GX6P | Y                  | Y   |
      | 9-Name validation         | English  | Paris    | London   | 2              | One way     | pm                | pm               |          | 17 Jun  | auto tester | sur name | VISA             | 4929498311405001 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com | EN01-QYGC-JXK7-GX6P | Y                  | Y   |
      | 10-Name validation with - | English  | Paris    | London   | 2              | One way     | pm                | pm               |          | 17 Jun  | test test   | sur-name | VISA Electron    | 4937370000000015 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com | EN01-QYGC-JXK7-GX6P | Y                  | Y   |
#  @e2e
    Examples:

      | Test case               | Language | From      | To        | passengerCount | tripType     | Outbound Timeslot | Inbound Timeslot | Outbound | Inbound | Firstname  | Lastname | Card type        | Card Number      | Expiry Month | Expiry Year | CVV  | postcode | country        | email                         | Booking Reference   | Confirmation email | PNR |
      | 1                       | French   | Londres   | Paris     | 2              | Aller simple | pm                | pm               |          | 7 juin  | autotester | surname  | VISA             | 4937370000000015 | 12           | 2018        | 123  | 1235     | France         | automation.tester55@gmail.com | EN01-W4TY-FV6C-EWGU | Y                  | Y   |
      | 2                       | French   | Bruxelles | Londres   | 2              | Aller-retour | pm                | pm               |          | 7 juin  | autotester | surname  | American Express | 374290482911992  | 12           | 2018        | 1234 | 1235     | United Kingdom | automation.tester55@gmail.com | EN01-DPXR-FMFX-TH56 | Y                  | Y   |
      | 3                       | French   | Paris     | Londres   | 2              | Aller-retour | pm                | pm               |          | 7 juin  | autotester | surname  | Mastercard       | 5573480000000190 | 12           | 2018        | 123  | 1235     | United Kingdom | automation.tester55@gmail.com | EN01-DPXR-FMFX-TH56 | Y                  | Y   |
      | 4 Visa delata on french | French   | Londres   | Bruxelles | 2              | Aller-retour | pm                | pm               |          | 7 juin  | autotester | surname  | VISA             | 4539792000000004 | 12           | 2018        | 123  | 1235     | United Kingdom | automation.tester55@gmail.com | EN01-DPXR-FMFX-TH56 | Y                  | Y   |
#  @e2e
    Examples:

      | Test case            | Language | From    | To     | passengerCount | tripType           | Outbound Timeslot | Inbound Timeslot | Outbound | Inbound | Firstname  | Lastname | Card type     | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country | email                         | Booking Reference | Confirmation email | PNR |
      | 1                    | Dutch    | Brussel | Londen | 2              | Heen- en terugreis | pm                | pm               |          | 7 jun.  | autotester | surname  | Mastercard    | 5255000000000019 | 12           | 2018        | 123 | 1235     | France  | automation.tester55@gmail.com | Y                 | Y                  | Y   |
      | 2                    | Dutch    | Londen  | Parijs | 3              | Enkele reis        | pm                | pm               |          | 7 jun.  | autotester | surname  | VISA          | 4539792000000004 | 12           | 2018        | 123 | 1235     | Belgium | automation.tester55@gmail.com | Y                 | Y                  | Y   |
      | 3 VISA Delta - Dutch | Dutch    | Londen  | Parijs | 3              | Enkele reis        | pm                | pm               |          | 7 jun.  | autotester | surname  | VISA Delta    | 4539792000000004 | 12           | 2018        | 123 | 1235     | Belgium | automation.tester55@gmail.com | Y                 | Y                  | Y   |
      | 4                    | Dutch    | Londen  | Parijs | 1              | Enkele reis        | pm                | pm               |          | 7 jun.  | autotester | surname  | VISA          | 4937370000000015 | 12           | 2018        | 123 | 1235     | Belgium | automation.tester55@gmail.com | Y                 | Y                  | Y   |
      | 5                    | Dutch    | Londen  | Parijs | 1              | Enkele reis        | pm                | pm               |          | 7 jun.  | autotester | surname  | VISA Electron | 4937370000000015 | 12           | 2018        | 123 | 1235     | Belgium | automation.tester55@gmail.com | Y                 | Y                  | Y   |


  @sanity_2@patch
  Scenario Outline:281 User do full booking with various combinations

    Given the user is in landing page
    When change the language to "<Language>"
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<passengerCount>" and "<tripType>"
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
  @e2e
    Examples:

      | Test case | Language | From   | To      | passengerCount | tripType     | Outbound Timeslot | Inbound Timeslot | Outbound | Inbound | Firstname  | Lastname | Card type | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country        | email                         | Booking Reference   | Confirmation email | PNR |
      | 1         | English  | London | Paris   | 1              | Return trip  | pm                | pm               | 10 Jun   | 17 Jun  | autotester | surname  | VISA      | 4929498311405001 | 12           | 2018        | 123 | E62EE    | United Kingdom | automation.tester55@gmail.com | EN01-PQ5V-WBLW-FZG1 | Y                  | Y   |
      | 2         | French   | Paris  | Londres | 2              | Aller simple | pm                | pm               | 5 juin   | 7 juin  | autotester | surname  | VISA      | 4937370000000015 | 12           | 2018        | 123 | 1235     | France         | sriram.angajala@gmail.com     | EN01-W4TY-FV6C-EWGU | Y                  | Y   |
      | 3         | Dutch    | Londen | Brussel | 3              | Enkele reis  | pm                | pm               | 5 jun.   | 7 jun.  | autotester | surname  | VISA      | 4539792000000004 | 12           | 2018        | 123 | 1235     | Belgium        | sriram.angajala@gmail.com     | Y                   | Y                  | Y   |


#  Scenario:Payment made
#  Given User has successfully completed payment
#  When User is on confirmation page
#  Then User sees confirmation of payment
#  And recap of their journey details
#  And link through to Reveal Page

  @debug@snap
  Scenario Outline:2995 LIVE ISSUE

    Given the user is in landing page
    When change the language to "<Language>"
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<passengerCount>" and "<tripType>"
    Then he should see proposals
#    When he select first available dates as on "<Outbound Timeslot>", "", "" and "<Inbound Timeslot>"
    When print the first date
    And print the last date

  @e2e
    Examples:

      | Test case | Language | From   | To    | passengerCount | tripType    | Outbound Timeslot | Inbound Timeslot | Outbound | Inbound | Firstname  | Lastname | Card type | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country        | email                         | Booking Reference   | Confirmation email | PNR |
      | 1         | English  | London | Paris | 1              | Return trip | pm                | pm               | 10 Jun   | 17 Jun  | autotester | surname  | VISA      | 4929498311405001 | 12           | 2018        | 123 | E62EE    | United Kingdom | automation.tester55@gmail.com | EN01-PQ5V-WBLW-FZG1 | Y                  | Y   |

