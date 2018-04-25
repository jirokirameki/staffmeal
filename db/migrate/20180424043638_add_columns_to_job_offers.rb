class AddColumnsToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :draft, :boolean, default: false
    add_column :job_offers, :image, :string
    
    add_column :job_offers, :what, :string
    add_column :job_offers, :team, :string
    add_column :job_offers, :want, :string
    
    # add_column :job_offers, :employment_status, :string
    add_column :job_offers, :permanent_staff, :boolean, default: false
    add_column :job_offers, :temporary_staff, :boolean, default: false
    add_column :job_offers, :arbeit, :boolean, default: false
    add_column :job_offers, :part_time_job, :boolean, default: false

    add_column :job_offers, :allowance, :string
    add_column :job_offers, :working_hours, :string
    add_column :job_offers, :url, :string
    add_column :job_offers, :other, :string
    add_column :job_offers, :makanai, :boolean, default: false    
  end
end
