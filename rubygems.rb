package 'gem' do
  options '--force-yes'
  not_if 'which gem'
end
