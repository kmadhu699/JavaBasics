Feature: Weekly regression tests


  @weekly_test@prod
  Scenario Outline: 123 Translation
    Given the user is on <Language> landing page
    Then Homepage content for <gameNo> on the page should be tranlslated to <Language>
    Then Hyperlink content for <gameNo> on the page should be tranlslated to <Language>

    Examples:
      | Language | gameNo |
      | English  | 26     |
      | French   | 26     |
      | Dutch    | 30     |

  @sanity_2@patch1
  Scenario Outline:281 User do full booking with various combinations

#    Given the user is in landing page
#    When change the language to "<Language>"
    Given the user is on <Language> landing page
    Given user is logged in to enovation app
    When he is in availability page
    And selects from "<From>" , "<To>" , "<Pax>" and <tripType>
    Then he should see proposals
    When he select random dates
#    When he select first available dates as on "<Outbound Timeslot>", "", "" and "<Inbound Timeslot>"
    Then he should see payment page
    When he enter travel details as "<Firstname>" and "<Lastname>"
    Then payment options screen should be available
    When he enter payment details with "<Card type>" "<Card Number>", "<Expiry Month>","<Expiry Year>" and "<CVV>"
    Then the payment should be sucessfull
    And enters their billing address details with "<postcode>" "<country>" and "<email>"
    Then booking confirmation page should be shown
    And the user should receive an email
  @weekly_test
    Examples:

      | Test case | Language | From   | To      | Pax | tripType     | Outbound Timeslot | Inbound Timeslot | Outbound | Inbound | Firstname  | Lastname | Card type | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country        | email                         | Booking Reference   | Confirmation email | PNR |
      | 1         | English  | London | Paris   | 1   | Return trip  | pm                | pm               | 10 Jun   | 17 Jun  | autotester | surname  | VISA      | 4929498311405001 | 12           | 2018        | 123 | E62EE    | United Kingdom | automation.tester55@gmail.com | EN01-PQ5V-WBLW-FZG1 | Y                  | Y   |
      | 2         | French   | Paris  | Londres | 2   | Aller simple | pm                | pm               | 5 juin   | 7 juin  | autotester | surname  | VISA      | 4937370000000015 | 12           | 2018        | 123 | 1235     | France         | automation.tester55@gmail.com | EN01-W4TY-FV6C-EWGU | Y                  | Y   |
      | 3         | Dutch    | Londen | Brussel | 3   | Enkele reis  | pm                | pm               | 5 jun.   | 7 jun.  | autotester | surname  | VISA      | 4937370000000015 | 09           | 2018        | 123 | 1235     | Belgium        | automation.tester55@gmail.com | Y                   | Y                  | Y   |

  @prod
    Examples:
      | Test case | Language | From   | To      | Pax | tripType     | Outbound Timeslot | Inbound Timeslot | Outbound | Inbound | Firstname  | Lastname | Card type | Card Number      | Expiry Month | Expiry Year | CVV | postcode | country        | email                         | Booking Reference   | Confirmation email | PNR |
      | 1         | English  | London | Paris   | 1   | Return trip  | pm                | pm               | 10 Jun   | 17 Jun  | autotester | surname  | VISA      | 4864460859163662 | 11           | 2018        | 123 | E62EE    | United Kingdom | automation.tester55@gmail.com | EN01-PQ5V-WBLW-FZG1 | Y                  | Y   |
      | 2         | French   | Paris  | Londres | 2   | Aller simple | pm                | pm               | 5 juin   | 7 juin  | autotester | surname  | VISA      | 4864460859163662 | 11           | 2018        | 123 | 1235     | France         | automation.tester55@gmail.com | EN01-W4TY-FV6C-EWGU | Y                  | Y   |
      | 3         | Dutch    | Londen | Brussel | 3   | Enkele reis  | pm                | pm               | 5 jun.   | 7 jun.  | autotester | surname  | VISA      | 4864460859163662 | 11           | 2018        | 123 | 1235     | Belgium        | automation.tester55@gmail.com | Y                   | Y                  | Y   |



#   Given I am on the landing page
#     When I change the domain / market language to "<Language>"
#    Then I should see all text on that page translated to "<Language>"
#
#     Examples:
#
#       | Test case | Language | Content_Terms |
#       | 1         | English  |               |
#       | 1         | French   |               |
#       | 1         | Dutch    |               |
#
#     Given I am logged in to Snap
#     When I select the language as "<Language>"
#     Then the content should match "<content>"
#
#     Examples:
#
#       | Test case | Language | Content_Terms |
#       | 2         | English  |  text         |
#       | 2         | French   |  text         |
#       | 2         | Dutch    |  text         |
#
#     Given I am logged in on Snap
#     When I open the Terms dialogue box
#     Then the content should match "<content_terms>"
#
#     Examples:
#
#       | Test case | Language | Content_Terms |
#       | 3         | English  |               |
#       | 3         | French   |               |
#       | 3         | Dutch    |               |
#
#     Given I am on the Snap landing page
#     When I change the language to "<Language>"
#     And I am logged in to Snap
#     And I have completed a booking
#     Then the booking confirmation page should be shown
#     And I should see a payment reference number
#     When I click on the Snap homepage link
#     Then I will land on the booking history page
#     And I will see the same payment reference number displayed
#     And the booking will show the same details as previously completed
#     When I go to www.mailinator.com/balleballe
#     Then I will see the email displayed in the language of the booking
#
#     Examples:
#
#       | Test case | Language | Content_Terms |
#       | 4         | English  |               |
#       | 4         | French   |               |
#       | 4         | Dutch    |               |