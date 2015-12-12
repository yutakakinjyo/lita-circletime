require "spec_helper"

describe Lita::Handlers::Circletime, lita_handler: true do

  it { is_expected.to route("build\s+(+*)").to(:set) }
  it { is_expected.to route("build today").to(:today) }
  it { is_expected.to route("build yestaday").to(:yestaday) }
  it { is_expected.to route("build week").to(:week) }
  it { is_expected.to route("build month").to(:month) }

end
