Feature: Responsive sanity checks



#  @res
  Scenario: Page loads

    Given user is in responsive page with link "https://content.eurostar.com/uk-en/train/france/paris"
    Then he can see the hero image with link "https://content-static.eurostar.com/styles/1900x490/s3/2016-07/paris_XL.jpg?itok=jJ1k84vv"
    And can view submit button


  @res
  Scenario Outline:Check links

    Given user is in responsive page with link "https://content.eurostar.com/uk-en/train/france/paris"
    When he click on link "<Link>" and type "<css_locator>"
    Then he should land in page with element with css "<css_expected>"
    Then go back to back page

    Examples:

      | Link          | css_locator                                                                 | css_expected |
      | Search & book | button.c-booking-magnet__submit-button.component.c-action.c-action--primary | table.ticket-table |





#    c-hero__image
#  c-booking-magnet__submit-button component c-action c-action--primary


#  https://content.eurostar.com/uk-en/train/france/paris

