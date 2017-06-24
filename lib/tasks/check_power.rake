namespace :check_power do
  desc "TODO"
  task check_now: :environment do
    module SmsTool
      account_sid = ENV['TWILIO_ACCOUNT_SID']
      auth_token = ENV['TWILIO_AUTH_TOKEN']

      @client = Twilio::REST::Client.new account_sid, auth_token

      def self.send_sms(number: , message: )
        @client.messages.create(
          from: ENV['TWILIO_PHONE_NUMBER'],
          to: "+91#{number}",
          body: "#{message}"
        )
      end
    end

    str = %x( upower -i /org/freedesktop/UPower/devices/battery_BAT0 ).to_s
    value = str[355..370]
    @updated = str[156..191]

    if value.count('d') == 0
      @status = true
    else
      @status = false
    end

    t = Time.now.to_s
    pow = Power.new(updated: t[11..18], status: @status)
    pow.save!

    all_powers = Power.all
    if (all_powers[-1].status != all_powers[-2].status)
      data = "\nOh no, it seems like the power at Mega Hostel is gone. We'll let you know as soon as the power is back \n" if all_powers[-1].status == false
      data = "\nYay, the power is back at Mega Hostel." if all_powers[-1].status == true
      message = "\nHello there Raghav \n #{data}.\nLast updated at #{all_powers.last.updated}\n\n Regards \n Raghav Vc"
      # SmsTool.send_sms(number: "9600129789", message: message)
    end
  end
end