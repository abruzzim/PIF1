require 'spec_helper'

describe 'Home Webpage:' do
  before do
    #
  end
  describe 'when the Home webpage #index is visited,' do
    before do
      visit root_path
    end
    describe 'Navigation Menu:' do
      it 'should have a navigation menu;' do
        expect(page).to have_css('nav')
      end
      describe 'Navigation Options:' do
        it 'should have a link to Home;' do
          expect(page).to have_link('Home', href: root_path)
        end
      end
    end
    describe 'Header Section:' do
      it 'should display the application name;' do
        expect(page).to have_css('h1', text: "Patient Information eForm")
      end
    end
    describe 'Body Section:' do
      it 'should display the application name;' do
        expect(page).to have_css('h2', text: "PIF")
      end
      it 'should display data in a table;' do
        expect(page).to have_css('html body div table')
      end
      describe 'Table Columns:' do
        before do
          @col1 = 'First'
          @col2 = 'Last'
          @col3 = 'DOB'
          @col4 = 'Gender'
        end
        it 'table column 1 should be First' do
          expect(page).to have_css('html body div table thead tr th', text: @col1)
        end
        it 'table column 2 should be Last' do
          expect(page).to have_css('html body div table thead tr th', text: @col2)
        end
        it 'table column 3 should be DOB' do
          expect(page).to have_css('html body div table thead tr th', text: @col3)
        end
        it 'table column 4 should be Gender' do
          expect(page).to have_css('html body div table thead tr th', text: @col4)
        end
      end
    end
  end
end