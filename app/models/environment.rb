class Environment < ApplicationRecord
  belongs_to :semester
  belongs_to :month

  def self.semester
    @env = Environment.find(1)
    @env.semester unless @env.nil?
  end

  def self.month
    @env = Environment.find(1)
    @env.month unless @env.nil?
  end

  def self.is_students_register_active?
    @env = Environment.find(1)
    @env.is_students_register_active unless @env.nil?
  end

  def self.is_advisors_register_active?
    @env = Environment.find(1)
    @env.is_advisors_register_active? unless @env.nil?
  end

  def self.is_schedules_register_active?
    @env = Environment.find(1)
    @env.is_schedules_register_active? unless @env.nil?
  end

  def self.update params = {}
    @env = Environment.find(1)

    if @env.nil?
      Environment.create(params)
    else
      @env.update(params)
    end
  end
end
