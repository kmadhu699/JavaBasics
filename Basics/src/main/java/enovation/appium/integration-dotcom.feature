@int@non-fr
Feature: Integration - Data from dotcom reflects from mobile

  @int_sanity
  Scenario Outline:SC1 User register in dotcom can be able to login accounts and check member ship

    Given user is registered in dotcom
    And fill his contact details
    And enrolled as "<membership_type>"
    And I login with same account from mobile
    Then I should see the dashboard page
    And I should see my membership number
    And I should see my email address in profile page

    Examples:
      | membership_type |
      | engaged         |

    @28
    Examples:
      | membership_type |
      | epp             |

    @olu
  Scenario:SC2 User register in dotcom can be able to login accounts and change password

    Given user is registered in dotcom
    And I login with same account from mobile
    Then I should see the dashboard page
    And I should see my email address in profile page
    When I change the password in profile page
    And if I refresh the page in mobile
    Then I should be logged out
    And I relogin with new password from mobile
    And can login with new password
    When I change the email
    And if I refresh the page on dashboard
    Then I should be logged out
    And I relogin with new email from mobile
    Then I should see the dashboard page

  @smoke
  Scenario:SC3 User register in dotcom can be able to do payment while adding a card

    Given user is registered in dotcom
    And fill his contact details
    And enrolled as "<membership_type>"
    And done a payment with new card which is saved
    And I login with same account from mobile
    And I go to home page
    When I am on the payment page
    And any available information available in the account for the contact details information fields
    And pay with a card ending "5001"
    Then the payment should be successfully done


  Scenario:SC4 User register in dotcom can be able to do payment while adding a card

    Given user is registered in dotcom
    And fill his contact details
    And enrolled as "<membership_type>"
    And done a payment with new card which is saved
    And PNR should be retrieved successfully



##    When I login with same account from mobile
#    When I am fill travel details and go to payment page
#    Then I should see blank fields for the card information
#    And pay with a new card ending "<Card Ending>"
#    Then the payment should be successfully done


#  Scenario Outline: User register in dotcom can be able to login accounts
#
#    Given user is registered in dotcom
#    And I login with same account from mobile
#    Then I should see the dashboard page
#    And navigated to contact details page
#    And entered name details
#      | Title      | <Title>      |
#      | First name | <First name> |
#      | Last name  | <Last name>  |
#    And enter address details
#      | Address line 1      | <Address line 1>      |
#      | Address line 2      | <Address line 2>      |
#      | Town/city           | <Town/city>           |
#      | County/state/region | <County/state/region> |
#      | Postcode/zip code   | <Postcode/zip code>   |
#      | Country             | <Country>             |
#    And enter phone details
##      | Country code | <Country code> |
#      | Number | <Number> |
#    And enter date of birth details
#      | Date of birth | <Date of birth> |
#    And enter other details
#      | Gender      | <Gender>      |
#      | Nationality | <Nationality> |
#    And save the details
#    And I login with same account from mobile
#    Then I should see the dashboard page
#    And I should see my email address in profile page
#    And check name details
#      | Title      | <Title>      |
#      | First name | <First name> |
#      | Last name  | <Last name>  |
#    And check address details
#      | Address line 1      | <Address line 1>      |
#      | Address line 2      | <Address line 2>      |
#      | Town/city           | <Town/city>           |
#      | County/state/region | <County/state/region> |
#      | Postcode/zip code   | <Postcode/zip code>   |
#      | Country             | <Country>             |
#    And check phone details
##      | Country code | <Country code> |
#      | Number | <Number> |
##    And check date of birth details
##      | Date of birth | <Date of birth> |
##    And check other details
##      | Gender      | <Gender>      |
##      | Nationality | <Nationality> |
#
#    Examples:
#      | Test Case         | Title | First name | Last name | Address line 1  | Address line 2 | Town/city | County/state/region | Postcode/zip code | Country        | Country code | Number      | Date of birth | Gender | Nationality              |
#      | Enter all details | Mr    | First      | Last      | 151 Lathom Road | Greater Road   | London    | Essex               | E61EE             | United Kingdom | +44          | 07456422221 | 13/01/1980    | Male   | British (United Kingdom) |
##    | Enter all details | M    | First      | Last      | 151 Lathom Road | Greater Road   | London    | Essex               | E61EE             | France | +44          | 07456422221 | 13/01/1980    | Male   | France (France) |



  @int_sanity@smoke@dev25
  Scenario:SC5 Check dot com integration, accounts backend integration to accounts

    Given user is registered in dotcom
    And I login with same account from mobile
    Then I should see the dashboard page
    And I should see my email address in profile page
    And navigated to contact details page
    And entered name details
      | Title      | Mr     |
      | First name | Auto   |
      | Last name  | Tester |
    And save the details
    And I go to dashboard page
    And if I refresh the page on dashboard
    And I go to profile page
    And I should see my email address in profile page
    And check name details
      | Title      | Mr     |
      | First name | Auto   |
      | Last name  | Tester |

  @ecm-960
  Scenario:SC6 lastname field prepopulates

    Given user is registered in dotcom
    And I login with same account from mobile
    Then I should see the dashboard page
    And I go to home page
    And he go to view booking page
    Then lastname field is prepopulated with ""
    And navigated to contact details page
    And entered name details
      | Title      | Mr     |
      | First name | Auto   |
      | Last name  | Tester |
    And save the details
    And I go to dashboard page
    And he go to view booking page
    Then lastname field is prepopulated with "Tester"
