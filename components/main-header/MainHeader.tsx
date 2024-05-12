import Image from 'next/image';
import Link from 'next/link';
import logo from '../../assets/logo_s.svg';

import classes from './MainHeader.module.css';

const MainHeader = () => {
  return (
    <header className={classes['main-header']}>
      <div className={classes['logo-container']}>
        <Image src={logo} alt="Logo" width={100} height={100} />
        <h1>SBG Game Hub</h1>
      </div>
      <nav className={classes['header-nav']}>
        <Link href="/players">
          Players
        </Link>
        <Link href="/collection">
          Collection
        </Link>
        <Link href="/poll/current">
          Active Poll
        </Link>
      </nav>
    </header>
  );
}

export default MainHeader;
