'use client';

import Image from "next/image";
import { useRef, useState, ChangeEvent } from "react";

interface ImagePickerProps {
  label: string;
  name: string;
}

const ImagePicker = ({ label, name }: ImagePickerProps) => {
  const [pickedImage, setPickedImage] = useState<string | null>(null);
  const imageInput = useRef<HTMLInputElement>(null);

  function handlePickClick() {
    if (imageInput.current) {
      imageInput.current.click();
    }
  }

  function handleImageChange(event: ChangeEvent<HTMLInputElement>) {
    const file = event.target.files?.[0];

    if (!file) {
      setPickedImage(null);
      return;
    }

    const fileReader = new FileReader();

    fileReader.onload = () => {
      const result = fileReader.result;
      if (typeof result === "string") {
        setPickedImage(result);
      }
    };

    fileReader.readAsDataURL(file);
  }

  return (
    <div>
      <label htmlFor={name}>{label}</label>
      <div>
        <div>
          {!pickedImage && <p>Зображення не було обрано</p>}
          {pickedImage && (
            <Image
              src={pickedImage}
              alt="The image selected by the user."
              width={200}
              height={200}
              objectFit="cover"
            />
          )}
        </div>
        <input
          type="file"
          id={name}
          accept="image/png, image/jpeg"
          name={name}
          ref={imageInput}
          onChange={handleImageChange}
        />
        <button type="button" onClick={handlePickClick}>
          Обрати зображення
        </button>
      </div>
    </div>
  );
};

export default ImagePicker;
