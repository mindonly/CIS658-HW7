require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
        @bug = Bug.create(title: "blank title",
                          description: "blank description",
                          issue_type:0,
                          priority:0,
                          status:0)
    end

    test "bug must be valid" do
        assert @bug.valid?
    end

    test "title must be present" do
        @bug.title = ""
        assert_not @bug.valid?
    end

    test "description must be present" do
        @bug.description = ""
        assert_not @bug.valid?
    end

    test "issue_type must be valid" do
        invalid_statuses = [-10, 4, 9, -3, 42]
        invalid_statuses.each do |is|
            begin
                @bug.status = is
				assert false, "#{is} shoud be invalid}"
 			rescue
 				assert true
 			end
 		end
 	end

	test "issue_type must be issue, enhancement, or feature" do
		valid_statuses = [:issue, :enhancement, :feature]
		valid_statuses.each do |vs|
		    begin
				@post.status = vs
                assert true
           rescue
                assert false, "#{vs} should be invalid}"
           end
        end
    end
end
