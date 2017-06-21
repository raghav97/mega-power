namespace :check_power do
  desc "TODO"
  task check_now: :environment do
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
  end
end