#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/../views_helper')

describe "/quizzes/history" do
  it "should render" do
    course_with_student
    view_context
    assigns[:quiz] = @course.quizzes.create!
    assigns[:user] = @user
    assigns[:submission] = assigns[:quiz].generate_submission(@user)
    assigns[:current_submission] = assigns[:submission]
    assigns[:submission]
    assigns[:version_instances] = assigns[:submission].submitted_versions
    render "quizzes/history"
    response.should_not be_nil
  end
end

