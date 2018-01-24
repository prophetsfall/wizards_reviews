import WizardShow from '../../app/javascript/react/components/WizardShow'

import { shallow, mount } from 'enzyme';
import jasmineEnzyme from 'jasmine-enzyme';
import React from 'react';


Object.assign(global, {
 jasmineEnzyme,
 mount,
 React,
 shallow,
});

let requireAll = requireContext => {
 requireContext.keys().forEach(requireContext);
};

describe('WizardShow', ()=>{
 let wrapper
 beforeEach(() => {
   jasmineEnzyme();
   wrapper = mount(
     <WizardShow />
   )
   wrapper.setProps({name: 'Ian', description: 'A description', img_url:"www.google.com", rating: 20})
 });

 it('Should return html with the data from props', () => {
   expect(wrapper.find('h1').first()).toHaveText('Ian')
   expect(wrapper.find('p').at(1)).toHaveText('A description')
   expect(wrapper.find('img').at(1)).toHaveText('google')

 })
})
