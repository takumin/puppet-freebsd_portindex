require 'spec_helper'

describe 'freebsd_portindex' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "freebsd_portindex class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('freebsd_portindex::params') }
        it { should contain_class('freebsd_portindex::install').that_comes_before('freebsd_portindex::config') }
        it { should contain_class('freebsd_portindex::config') }
        it { should contain_class('freebsd_portindex::service').that_subscribes_to('freebsd_portindex::config') }

        it { should contain_service('freebsd_portindex') }
        it { should contain_package('freebsd_portindex').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'freebsd_portindex class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('freebsd_portindex') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
