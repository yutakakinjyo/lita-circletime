require "spec_helper"

describe Lita::Handlers::Circletime, lita_handler: true do

  it { is_expected.to route("org orgname").to(:set) }
  it { is_expected.to route("org").to(:show) }
  it { is_expected.to route("build today").to(:today) }
  it { is_expected.to route("build yestaday").to(:yestaday) }
  it { is_expected.to route("build week").to(:week) }
  it { is_expected.to route("build month").to(:month) }
  
  it "set" do
    send_message("org yutakakinjyo")
    expect(replies.last).to eq("set yutakakinjyo to org name")
  end

  it "show org name" do
    send_message("org yutakakinjyo")
    send_message("org")
    expect(replies.last).to eq("yutakakinjyo is setted to org now")
  end

  it "show nothing org name message" do
    send_message("org")
    expect(replies.last).to eq("you not set org name yet")
  end



end
