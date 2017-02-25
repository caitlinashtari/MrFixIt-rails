FactoryGirl.define do
  factory(:user) do
   email("test@test.com")
   password("123456")
 end

 factory(:worker) do
   email("test@test.com")
   password("123456")
 end

 factory(:job) do
   title('Clean the database')
   description('The Mr. Fix It database needs cleaning')
 end
end
