# Stytch Ruby example application

This example application demonstrates how one may use Stytch within a Ruby application.

This project uses Stytch's backend [Ruby SDK](https://github.com/stytchauth/stytch-ruby), which wraps [Stytch's API endpoints](https://stytch.com/docs/api).

This application features our Email Magic Links product. You can use this application's source code as a learning resource, or use it as a jumping off point for your own project. We are excited to see what you build with Stytch!

## Setup

Follow the steps below to get this application running using your own Stytch credentials.

### In the Stytch Dashboard

1. Create a [Stytch](https://stytch.com/) account. A new Stytch project called "My first project" will be created for you.

2. Within your new project, navigate to [Redirect URLs](https://stytch.com/dashboard/redirect-urls), and add `http://localhost:3000/authenticate` as the types **Login** and **Sign-up**.
   
   <img width="400" alt="Redirect URLs" src="https://user-images.githubusercontent.com/100632220/217983021-d8bf6fff-6a68-4e94-bffd-d062e69c8817.png">

3. Next, navigate to [API Keys](https://stytch.com/dashboard/api-keys). You will need the `project_id` and `secret` values found on this page.

### On your machine

In your terminal, clone the project and install dependencies:

```bash
git clone https://github.com/stytchauth/stytch-ruby-example.git
```
```bash
cd stytch-ruby-example
```
``` If you haven't yet installed bundler:
gem install bundler
```
Install gems:
```
bundle install
```

Next, open `.env` in the text editor of your choice and set the environment variables using the `project_id` and `secret` found on [API Keys](https://stytch.com/dashboard/api-keys). Leave the `STYTCH_PROJECT_ENV` value as `test`. This is what a completed .env file will look like:

```
HOST="http://localhost:3000"
STYTCH_ENV="test"
STYTCH_PROJECT_ID="project-test-00000000-0000-1234-abcd-abcdef1234"
STYTCH_SECRET="secret-test-12345678901234567890abcdabcd"
```

## Running locally

After completing all of the above steps, the application can be run with the command:

```bash
ruby ./server.rb
```

The application will be available at [`http://localhost:3000`](http://localhost:3000), where you'll be able to complete the Email Magic Links flow.

## Next steps

This example app showcases a small portion of what you can accomplish with Stytch. Here are a few ideas to explore:

1. Add additional login methods like [OAuth](https://stytch.com/docs/api/oauth-google-start) or [Passwords](https://stytch.com/docs/api/password-create).
2. Add session logic to your application using [Stytch Sessions](https://stytch.com/docs/api/session-auth).
3. Secure your app further by building MFA authentication using methods like [OTP](https://stytch.com/docs/api/send-otp-by-sms).

## Get help and join the community

#### :speech_balloon: Stytch community Slack

Join the discussion, ask questions, and suggest new features in our ​[Slack community](https://join.slack.com/t/stytch/shared_invite/zt-nil4wo92-jApJ9Cl32cJbEd9esKkvyg)!

#### :question: Need support?

Check out the [Stytch Forum](https://forum.stytch.com/) or email us at [support@stytch.com](mailto:support@stytch.com).