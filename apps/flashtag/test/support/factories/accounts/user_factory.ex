defmodule Flashtag.Accounts.UserFactory do
  defmacro __using__(_opts) do
    quote do
      def accounts_user_factory do
        %Flashtag.Accounts.User{
          email: "joe_tester@test.com",
          name: "Joe Testerton",
          is_admin: false,
        }
      end
    end
  end
end
