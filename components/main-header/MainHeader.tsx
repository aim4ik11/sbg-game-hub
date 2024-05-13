import Image from 'next/image';
import Link from 'next/link';
import logo from '../../assets/logo_s.svg';

import classes from './MainHeader.module.css';

const MainHeader = () => {
  return (
    <header className={classes['main-header']}>
      <div className={classes['logo-container']}>
        <Link href='/'>
          <Image src={logo} alt="Logo" width={100} height={100} />
          <h1>SBG Game Hub</h1>
        </Link>
      </div>
      <nav className={classes['header-nav']}>
        <Link href="/players">
          Гравці
        </Link>
        <Link href="/collection">
          Колекція
        </Link>
        <Link href="/poll/current">
          Активне опитування
        </Link>
      </nav>
      <nav className={classes['header-nav']}>
        <Link href="/register">
          Зареєструватись
        </Link>
        <Link href="/login">
          Увійти
        </Link>
      </nav>
    </header>
  );
}

export default MainHeader;
