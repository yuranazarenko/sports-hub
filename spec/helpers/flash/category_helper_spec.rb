# frozen_string_literal: true

require "rails_helper"

RSpec.describe Flash::CategoryHelper, aggregate_failures: true do
  context "category massage text for create" do
    subject { Flash::CategoryHelper::RESULT_CODE_DATA[code] }

    context "success messages" do
      let(:code) { :success }

      it "has proper flash params" do
        expect(subject[:theme]).to eq "success"
        expect(subject[:icon]).to eq "check"
        expect(subject[:note]).to eq "Category saved"
      end
    end

    context "error messages" do
      let(:code) { :error }

      it "has proper flash params" do
        expect(subject[:theme]).to eq "danger"
        expect(subject[:icon]).to eq "ban"
        expect(subject[:note]).to eq "Could not save category"
      end
    end
  end
end
