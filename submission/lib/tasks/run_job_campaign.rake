task :run_campaign, [:num_openings, :num_applications] => [:environment] do |t, args|
  if args.num_openings.present? && args.num_applications.present?
    company = Company.create(name: 'test company')
    position = Position.create(company_id: company.id, description: 'A great job', application_limit: args.num_openings)

    args.num_applications.to_i.times do |i|
      i += 1
      user = User.create(name: "User #{i}")
      app_engine = ApplicationEngine.new(position.id, user.id)
      result = app_engine.submit_application({ resume: "great employee #{i}" })
      if result
        puts "You have successfully applied to this position, #{user.name}"
      else
        puts "Sorry #{user.name}, but this job campaign is now closed"
      end
    end
    puts "#{position.applications.count} applications have been accepted for the position"
    rejected_count = args.num_applications.to_i - args.num_openings.to_i
    puts "#{rejected_count} applications were not accepted" if rejected_count > 0
  else
    puts "Please pass two parameters: number of job openings and number of applications received. Example: 'run_campaign[20, 50]'"
  end
end
