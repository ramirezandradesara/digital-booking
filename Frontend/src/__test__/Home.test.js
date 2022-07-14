import { render } from '@testing-library/react';
import UserHome from '../pages/UserHome';
import Home from '../pages/Home'

test('Correcto renderizado de Home', () => {
    const userHome = render(<UserHome />)
    expect(userHome.container).toBeInTheDocument();
});

test('Correcto renderizado de UserHome', () => {
    const home = render(<Home />)
    expect(home.container).toBeInTheDocument();
});