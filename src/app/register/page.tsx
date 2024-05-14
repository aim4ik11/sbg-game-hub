import ImagePicker from "../../../components/images/ImagePicker";

const RegisterPage = () => {
  return (
    <>
      <header>
        Створюй акаунт
      </header>
      <main>
        <form>
          <div>
            <p>
              <label htmlFor="nick">Твій нік</label>
              <input type="text" id="nick" name="nick" required />
            </p>
            <p>
              <label htmlFor="email">Твоя електронна пошта</label>
              <input type="email" id="email" name="email" required />
            </p>
            <p>
              <label htmlFor="pass">Твій пароль</label>
              <input type="password" id="pass" name="pass" required />
            </p>
            <p>
              <ImagePicker label="Твій аватар" name="avatar" />
            </p>
            <p>
              <button>Зареєструватись</button>
            </p>
          </div>
        </form>
      </main>
    </>
  );
};

export default RegisterPage;