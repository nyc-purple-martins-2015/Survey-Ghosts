get "/surveys" do
  @surveys = Survey.all
  # @author =
  erb :"/surveys/index"
end

