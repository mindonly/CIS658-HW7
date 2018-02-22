require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    def setup
        @bug = bugs(:one)
        #@bug = Bug.create(title: "blank title",
        #                  description: "blank description",
        #                  issue_type:0,
        #                  priority:0,
        #                  status:0,
        #                  user_id:2)
    end

    test "bug must be valid" do
        puts @bug.valid?
        puts @bug.errors.messages
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

    test "issue type must be valid" do
        invalid_types = [-10, 4, :feet, -3, 42, :roan]
        invalid_types.each do |it|
            begin
                @bug.issue_type = it
				assert false, "#{it} shoud be invalid}"
 			rescue
 				assert true
 			end
 		end
    end

	test "issue type must be issue, enhancement, or feature" do
		valid_types = [:issue, :enhancement, :feature]
		valid_types.each do |vt|
		   begin
				@bug.issue_type = vt
                assert true
           rescue
                assert false, "#{vs} should be invalid}"
           end
        end
    end
    
    test "priority must be valid" do
        invalid_priorities = [-10, 4, :feet, -3, 42, :roan]
        invalid_priorities.each do |ip|
            begin
                @bug.priority = ip
				assert false, "#{it} shoud be invalid}"
 			rescue
 				assert true
 			end
 		end
    end

	test "priority must be low, medium, or high" do
		valid_priorities = [:low, :medium, :high]
		valid_priorities.each do |vp|
		   begin
				@bug.priority = vp
                assert true
           rescue
                assert false, "#{vs} should be invalid}"
           end
        end
    end

    test "status must be valid" do
        invalid_statuses = [-10, 4, :feet, -3, 42, :roan]
        invalid_statuses.each do |is|
            begin
                @bug.status = is
				assert false, "#{is} shoud be invalid}"
 			rescue
 				assert true
 			end
 		end
 	end

	test "status must be open, closed, or monitor" do
		valid_statuses = [:open, :closed, :monitor]
		valid_statuses.each do |vs|
		   begin
				@bug.status = vs
                assert true
           rescue
                assert false, "#{vs} should be invalid}"
           end
        end
    end
end
