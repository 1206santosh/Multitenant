class Organisation < ApplicationRecord

  after_create :create_tenant

  def create_tenant
    Apartment::Tenant.create(self.domain)
  end

end
