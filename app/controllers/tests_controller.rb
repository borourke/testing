class TestsController < ApplicationController
  def test
    render json: { success: "Smoke test passed" }
  end

  def error
    raise "This is a test application error"
  end
end